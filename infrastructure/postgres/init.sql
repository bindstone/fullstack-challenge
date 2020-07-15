-- CREATE USER docker WITH PASSWORD 'docker';
-- CREATE DATABASE docker;
-- GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
-- CREATE SCHEMA docker AUTHORIZATION docker;
CREATE TABLE
    persons (
        id int PRIMARY KEY,
        firstName varchar(255),
        lastName varchar(255)
);

insert into persons (id,firstName,lastName) values (1,'Dummy','Dummy')
