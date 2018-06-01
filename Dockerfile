FROM openjdk:11-jre

ENV AMQ_VERSION 5.15.4
ENV AMQ_PATH /opt/apache-activemq-$AMQ_VERSION

RUN curl "http://archive.apache.org/dist/activemq/5.15.4/apache-activemq-5.15.4-bin.tar.gz" -o AMQ-bin.tar.gz

RUN tar xzf AMQ-bin.tar.gz -C /opt && chmod 755 $AMQ_PATH/bin/activemq

WORKDIR $AMQ_PATH

EXPOSE 8161 1883 5672 61614 61616 61613

CMD ["/bin/sh", "-c", "bin/activemq console"]
