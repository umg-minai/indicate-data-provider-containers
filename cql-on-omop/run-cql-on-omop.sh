#!/bin/sh

# TODO(moringenj): should not use --password="${TARGET_DB_PASSWORD}"
# TODO(moringenj): MIMIC is temporary
CQL_ON_OMOP_DATABASE_PASSWORD=${SOURCE_DB_PASSWORD} \
  java -Xmx24000000000                              \
    -jar cql-on-omop-${CQL_ON_OMOP_VERSION}.jar     \
    batch                                           \
      --omop-version=v5.4.MIMIC \
      --host="${SOURCE_DB_HOST}"                    \
      --port="${SOURCE_DB_PORT}"                    \
      --user="${SOURCE_DB_USER}"                    \
      --database="${SOURCE_DB_DATABASE}"            \
      --schema="${SOURCE_DB_SCHEMA}"                \
      --result-name=".*result.*"                    \
      --context-value "${CQL_CONTEXT}"              \
      -I cql/                                       \
      --result-name='Results'                       \
      Main                                          \
      dbwrite                                       \
        --host="${TARGET_DB_HOST}"                  \
        --port="${TARGET_DB_PORT}"                  \
        --user="${TARGET_DB_USER}"                  \
        --password="${TARGET_DB_PASSWORD}"          \
        --database="${TARGET_DB_DATABASE}"          \
        --schema="${TARGET_DB_SCHEMA}"
