#!/bin/sh

PID_FILE=$GLASSFISH_HOME/glassfish/domains/domain1/config/pid

# when deploying a directory, Glassfish expect all submodules to be extracted
# which is usually not the case for EARs
# zip app back into a bundle and let Glassfish handle it
rm -f /var/app/Dockerfile
rm -f /var/app/Dockerrun.aws.json
zip /var/app.zip -r .

asadmin start-domain
asadmin deploy --contextroot / --name current-app /var/app.zip

inotifywait -qq -e delete_self $PID_FILE

