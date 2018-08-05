@byron @pdefante

byron was able to install ugmm.deb on bayonet
had to do hacks for dependencies, used php7 smarty3
php-auth may be removed but was in jessie previously so we removed it

apache2 was was setup including fixing virtual domains/static links
access logs show bayonet.plug.org.au/ugmm/ is being hi, but not redirecting to
/ugmm/memberself/
possibly due to php-auth not being installed



