FROM quay.io/keycloak/keycloak:latest
ENV DB_VENDOR POSTGRES
ENV DB_ADDR dart_keycloak_pg
ENV DB_DATABASE keycloak
ENV DB_USER keycloak
ENV DB_SCHEMA public
ENV DB_PASSWORD password
ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD letmein

COPY ./realm-export.json /tmp/realm-export.json
