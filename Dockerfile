FROM mariadb:latest
ENV MYSQL_ROOT_PASSWORD 123
EXPOSE 3306
COPY nominas.sql /docker-entrypoint-initdb.d
