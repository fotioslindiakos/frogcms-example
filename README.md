FrogCMS on OpenShift
====================

This git repository helps you get up and running quickly w/ a FrogCMS installation
on OpenShift.  The backend database is MySQL and the database name is the 
same as your application name (using $_ENV['OPENSHIFT_APP_NAME']).  You can call
your application by whatever name you want (the name of the database will always
match the application).


Running on OpenShift
----------------------------

Create an account at http://openshift.redhat.com/

Create a php-5.3 application (you can call your application whatever you want)

    rhc app create -a frogcms -t php-5.3

Add MySQL support to your application

    rhc cartridge add -a frogcms -c mysql-5.1

Add this upstream frogcms repo

    cd frogcms
    git remote add upstream -m master git://github.com/openshift/frogcms-example.git
    git pull -s recursive -X theirs upstream master
    # note that the git pull above can be used later to pull updates to FrogCMSs
    
Then push the repo upstream

    git push

That's it, you can now checkout your application at (default admin account is admin/admin):

    http://frogcms-$yournamespace.rhcloud.com
    http://frogcms-$yournamespace.rhcloud.com/admin for FrogCMS Administration


NOTES:

GIT_ROOT/.openshift/action_hooks/deploy:
    This script is executed with every 'git push'.  Feel free to modify this script
    to learn how to use it to your advantage.  By default, this script will create
    the database tables that this example uses.

    If you need to modify the schema, you could create a file 
    GIT_ROOT/.openshift/action_hooks/alter.sql and then use
    GIT_ROOT/.openshift/action_hooks/deploy to execute that script (make sure to
    back up your application + database w/ 'rhc app snapshot save' first :) )

