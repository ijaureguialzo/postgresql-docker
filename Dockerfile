ARG POSTGRES_VERSION=latest

FROM postgres:${POSTGRES_VERSION}

RUN localedef -i es_ES -c -f UTF-8 -A /usr/share/locale/locale.alias es_ES.UTF-8
