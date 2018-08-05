@byron @pdefante

Byron was able to install ugmm.deb on bayonet
had to do hacks for dependencies, used php7 smarty3
php-auth pkg was in jessie but not stretch, so we removed it

Stoped ngix just for testing and setup apache2
had to edit apache2 virtual domains/static links etc
access logs show bayonet.plug.org.au/ugmm/ is being hi, 
but not redirecting to bayonet.plug.org.au/ugmm/memberself/
(possibly due to php-auth not being installed)



