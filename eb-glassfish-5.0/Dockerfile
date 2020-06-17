FROM        amazon/aws-eb-glassfish:5.0-al-base

WORKDIR     /var/app

ADD         glassfish-start.sh /

ONBUILD     ADD . /var/app/

CMD         []
ENTRYPOINT  ["/glassfish-start.sh"]
