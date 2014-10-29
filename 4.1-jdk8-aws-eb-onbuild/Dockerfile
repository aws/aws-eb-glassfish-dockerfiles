FROM        glassfish:4.1-jdk8

WORKDIR     /var/app

ADD         glassfish-start.sh /

ONBUILD     ADD . /var/app/

CMD         []
ENTRYPOINT  ["/glassfish-start.sh"]

