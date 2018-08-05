@byron @pdefante

Byron was able to install ugmm.deb on bayonet.
had to remove php-auth pkg but it was in jessie but not stretch

Stoped nginx just for testing and setup apache2.
had to edit apache2 virtual domains/static links etc.
access logs show bayonet.plug.org.au/ugmm/ is being hit,
and redirects to bayonet.plug.org.au/ugmm/memberself/ but the page doesn't load
(possibly due to php-auth not being installed)

install notes
apt-get install --no-install-recommends php php-fpm devscripts debhelper smarty3 apache2
add mirror to sources for jessie pkgs
apt-get install --no-install-recommends php-auth/jessie
git clone https://github.com/plugorgay/ugmm.git

this is missing accoring to apache logs https://github.com/plugorgau/ugmm/blob/master/www/PLUG/ldapconnection.inc.php
https://github.com/plugorgau/ugmm/blob/master/www/PLUG/ldapconnection.inc.php.example







