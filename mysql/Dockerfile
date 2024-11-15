FROM mysql:8.0

USER root

RUN microdnf install -y gettext && \
    microdnf clean all && \
    rm -rf /var/cache/dnf

RUN mkdir -p /docker-entrypoint-initdb.d && \
    chmod 755 /docker-entrypoint-initdb.d

EXPOSE 3306

USER mysql