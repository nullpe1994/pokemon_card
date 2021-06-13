CREATE DATABASE pokemon;
\c pokemon
CREATE TABLE users (
    user_id varchar(16) NOT NULL,
    password varchar(16),
    isDelete varchar(1) default '0',
    PRIMARY KEY (user_id)
);
INSERT INTO users VALUES ('master','114514','0');