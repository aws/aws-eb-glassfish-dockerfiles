FROM        glassfish:4.0-jdk7

WORKDIR     /var/app

ADD         glassfish-start.sh /

ONBUILD     ADD . /var/app/

CMD         []
ENTRYPOINT  ["/glassfish-start.sh"]

