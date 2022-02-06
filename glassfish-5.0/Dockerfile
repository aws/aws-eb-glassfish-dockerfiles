FROM        amazonlinux:2018.03

ENV         JAVA_HOME         /usr/lib/jvm/jre-1.8.0-openjdk.x86_64
ENV         GLASSFISH_HOME    /usr/local/glassfish5
ENV         PATH              $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN         yum update -y && \
            curl -L -o /tmp/epel-release.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
            yum install -y /tmp/epel-release.rpm && \
            yum install -y zip unzip inotify-tools java-1.8.0-openjdk-devel

RUN         curl -L -o /tmp/glassfish-5.0.zip http://download.oracle.com/glassfish/5.0/release/glassfish-5.0.zip && \
            unzip /tmp/glassfish-5.0.zip -d /usr/local && \
            rm -f /tmp/glassfish-5.0.zip

# patch joda-time jar and grizzly jar to solve ssl issue with glassfish 5.0.
RUN         curl https://repo1.maven.org/maven2/joda-time/joda-time/2.9.9/joda-time-2.9.9.jar --output "$GLASSFISH_HOME/glassfish/domains/domain1/lib/ext/joda-time-2.9.9.jar"
RUN         curl https://repo1.maven.org/maven2/org/glassfish/grizzly/grizzly-npn-osgi/1.8/grizzly-npn-osgi-1.8.jar --output "$GLASSFISH_HOME/glassfish/modules/grizzly-npn-osgi.jar"
RUN         curl https://repo1.maven.org/maven2/org/glassfish/grizzly/grizzly-npn-bootstrap/1.8/grizzly-npn-bootstrap-1.8.jar --output "$GLASSFISH_HOME/glassfish/modules/endorsed/grizzly-npn-bootstrap.jar"

EXPOSE      8080 4848 8181

WORKDIR     /usr/local/glassfish5

CMD         asadmin start-domain --verbose
