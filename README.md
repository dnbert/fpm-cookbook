Description
===========
Installs and sets ups Jordan Sissel's Effin' Package Manager (FPM)

Uses the gem_package resource to install the rubygem of FPM and
then uses the script resource to symlink 'gem env gemdir'/bin/fpm
to /usr/bin/fpm.

Requirements
============
RubyGems (>= 1.8)

Usage
=====
Add FPM recipe to your role list

More
====
Please feel free to contact me if you have any questions or comments
about this recipe. I'll be happy to update or modify to better 
support the masses.
