FROM openjdk:8-jre-alpine

WORKDIR /flyway

ENV FLYWAY_VERSION 3.2.1

RUN apk update && \
    apk --no-cache add --update wget bash openssl && \
    wget https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 && \
    rm flyway-commandline-${FLYWAY_VERSION}.tar.gz && \
    ln -s /flyway/flyway /bin/flyway && \
    apk del wget

ENTRYPOINT ["flyway"]
CMD ["-?"]