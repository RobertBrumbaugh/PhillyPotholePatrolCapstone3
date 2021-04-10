BEGIN TRANSACTION;

DROP TABLE IF EXISTS reports;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS severity_types;
DROP TABLE IF EXISTS status_types;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (username)
);

INSERT INTO users (username,password_hash,role) VALUES ('JohnnyQPublic','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('employee','$2a$10$EwiZHu3h.v1KmhrCpNloEOSPlvK3fKCwehl1uHgoWh7vfsDriAFR.','ROLE_EMPLOYEE');

CREATE TABLE reports
(
	report_id serial,
	username varchar(50),
	lat float,
	lng float, 
	location varchar(100),
	user_severity varchar(50),
	reported varchar(32),
	inspected varchar(32),
	repaired varchar(32),
	status int,
	severity int,
	img varchar(300),
	
	constraint pk_reports primary key (report_id)
);

CREATE TABLE status_types
(
        status_id int,
        status_desc varchar(100),
        
        constraint pk_status_types primary key (status_id)
);

CREATE TABLE severity_types
(
        severity_id int,
        severity_desc varchar(100),
        
        constraint pk_severity_types primary key (severity_id)
);

ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_username foreign key (username) references users (username);

ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_status foreign key (status) references status_types (status_id);
        
ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_severity foreign key (severity) references severity_types (severity_id);
        
INSERT INTO severity_types (severity_id, severity_desc) 
        VALUES 
        (0, 'TBD'),
        (1, 'minor'), 
        (2, 'average'), 
        (3, 'major');
        
INSERT INTO status_types (status_id, status_desc) 
        VALUES 
        (1, 'reported'),
        (2, 'inspected'),
        (3, 'repaired');
        
INSERT INTO reports (username, lat, lng, location, user_severity, reported, status, severity) 
        VALUES 
        ( 'JohnnyQPublic', 39.95277884627590, -75.16361112345678, '123 Fake Street Hollywood CA 90210', 'Minor', '4/5/2021, 9:03:20 AM', 1, 0),
        ( 'JohnnyQPublic', 39.97277804978631, -75.13161109876543, '123 Fake Street Hollywood CA 90210', 'Could bust a tire', '4/6/2021, 5:13:20 PM', 1, 0);
        

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;
        
        
COMMIT TRANSACTION;