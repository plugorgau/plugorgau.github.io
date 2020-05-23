---
layout: page
title: User Group membership manager
permalink: /projects/ugmm/
---

This project seeks to lash together various projects to implement a stack of software to help manage the membership requirements of user groups.

See the [mailing list](http://lists.plug.org.au/mailman/listinfo/ugmm).

Details of basic implementation currently.

LDAP Database storing all PLUG Members.

The base of the database is as follows

```
# plug.org.au
dn: dc=plug,dc=org,dc=au
objectClass: top
objectClass: dcObject
objectClass: organization
o: Perth Linux Users Group
dc: plug

# Users, plug.org.au
dn: ou=Users,dc=plug,dc=org,dc=au
ou: Users
objectClass: organizationalUnit
objectClass: top

# Groups, plug.org.au
dn: ou=Groups,dc=plug,dc=org,dc=au
ou: Groups
objectClass: organizationalUnit
objectClass: top

# UPG, Groups, plug.org.au
dn: ou=UPG,ou=Groups,dc=plug,dc=org,dc=au
ou: UPG
objectClass: organizationalUnit
objectClass: top

# maxUid, Users, plug.org.au
dn: cn=maxUid,ou=Users,dc=plug,dc=org,dc=au
objectClass: namedObject
objectClass: extensibleObject
objectClass: top
uidNumber: 12000
cn: maxUid
x-plug-paymentID: 377
```

Fairly obvious where things are stored. UPG is for users individual groups. i.e. user bob has group bob as well. This just keeps the directory cleaner and easier to find the operational groups under Groups. maxUid is used to keep track of the next uid to assign a user and the x-plug-paymentID of maxUid is used to keep track of the next payment ID.

We have a custom schema to support membership payments and mail forwarding. This schema is not finalised to if you wish to use it also, beware that some of the OID's may change. (This will eventually be stored in a bzr repository so you can get the latest version easily).

```
#1.3.6.1.4.1.37966.

attributetype ( 1.3.6.1.4.1.37966.101
NAME 'x-plug-paymentDate'
DESC 'Date of Payment'
EQUALITY generalizedTimeMatch
ORDERING generalizedTimeOrderingMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.24 )

attributetype ( 1.3.6.1.4.1.37966.102
NAME 'x-plug-paymentID'
DESC 'Payment uniqueID'
EQUALITY integerMatch
ORDERING integerOrderingMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 )

attributetype ( 1.3.6.1.4.1.37966.103
NAME 'x-plug-paymentAmount'
DESC 'Payment amount (in cents)'
EQUALITY integerMatch
ORDERING integerOrderingMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 )

attributetype ( 1.3.6.1.4.1.37966.104
NAME 'x-plug-paymentType'
DESC 'Type of Payment (Full, Concession, Family)'
EQUALITY caseIgnoreMatch
SUBSTR caseIgnoreSubstringsMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.15 )

attributetype ( 1.3.6.1.4.1.37966.105
NAME 'x-plug-paymentDescription'
DESC 'Payment Description'
SUP description )

attributetype ( 1.3.6.1.4.1.37966.106
NAME 'x-plug-paymentYears'
DESC 'How many years is the payment for?'
EQUALITY integerMatch
ORDERING integerOrderingMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 )

objectClass ( 1.3.6.1.4.1.37966.10
NAME 'x-plug-payment'
DESC 'Payment'
SUP top
STRUCTURAL
MUST ( x-plug-paymentDate $ x-plug-paymentID $ x-plug-paymentAmount $ x-plug-paymentType $ x-plug-paymentYears )
MAY ( x-plug-paymentDescription )
)

attributetype ( 1.3.6.1.4.1.37966.107
NAME ( 'mailForward' )
DESC 'RFC1274: RFC822 Mailbox'
EQUALITY caseIgnoreIA5Match
SUBSTR caseIgnoreIA5SubstringsMatch
SYNTAX 1.3.6.1.4.1.1466.115.121.1.26{256} )

objectClass ( 1.3.6.1.4.1.37966.20
NAME 'mailForwardingAccount'
DESC 'Allows mail forwarding address'
SUP top
AUXILIARY
MAY ( mailForward )
)
```

Storage of users are with objectClasses top, person, posixAccount, inetOrgPerson, shadowAccount and mailForwardingAccount. mailForwarding account is a custom PLUG objectClass. posixAccount is from the rfc2307bis schema (so we aren't using the nis.schema file that comes with OpenLDAP).

We are using a DN of the form uidNumber=123,ou=Users,dc=plug,dc=org,dc=au so that users can change their username (uid) without having to change the DN and everywhere in the LDAP directory where the DN is referenced. The mail attribute is users email address for record keeping. The mailForward attribute is the users email address we forward their @members.plug.org.au email to. Currently if mailForward is missing (no forwarding) we forward to the email in the mail attribute as we are not currently hosting local email for users. In the future when this changes we can revert to only forwarding if a mailForward attribute is present.

The shadowExpire attribute is being used to lockout the user when their account has expired. This still allows them to login via the web interface to see account status and update user details. A currentmembers group is also maintained so that applications that don't understand shadowExpire but can do selections based on group are also able to lockout accounts. The currentmembers group needs to be updated daily via a runner script which can also send out the expiring/expired users emails.

Shell Authentication off LDAP

We are using the nss-pam-ldap package from Arthur de Jong (https://arthurdejong.org/nss-pam-ldapd/). The 0.7.13 version in Ubuntu and Debian both contain a bug that we discovered that has since been fixed. For this reason we have patched the package and forced dpkg to hold it so it doesn't get upgraded accidently.

The main config file for all this is /etc/nslcd.conf, most of which is very easy to figure out.
The magic comes from the filter lines, and the pam_authz_search. Both are LDAP searchs that are used to filter the responses from the database.
For example, we have the following filter line on our shell server which limits the accounts to those we are currentmembers. This could be changed for example to only show accounts that have shell access enabled.

```
filter passwd (&(objectClass=posixAccount)(memberOf=cn=currentmembers,ou=Groups,dc=plug,dc=org,dc=au))
```

We use the pam_authz_search on the shell server as well to limit login to only accounts with shell access enabled.

```
pam_authz_search (&(uid=$uid)(memberOf=cn=currentmembers,ou=Groups,dc=plug,dc=org,dc=au)(memberOf=cn=shell,ou=Groups,dc=plug,dc=org,dc=au))
```

Note however, that while we are using groups to specify currentmembers, it's actually in the shadow entries that we use shadowExpire to actually store the users expiry, which means without the runner script moving users from currentmembers to expiredmembers, they will be unable to login after their account expires. The usage of groups allows us to only deal with members who should be current, rather than having 350 accounts of which only 50 are actually valid.
