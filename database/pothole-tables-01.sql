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
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

CREATE TABLE reports
(
	report_id serial,
	user_id int,
	location_id int,
	reported date,
	inspected date,
	repaired date,
	status int,
	severity int,
	img varchar(300),
	
	constraint pk_reports primary key (report_id)
);

CREATE TABLE locations
(
        location_id serial,
        street varchar(100),
        city varchar(100),
        district varchar(100),
        zip int,
        
        constraint pk_locations primary key (location_id)
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
        fk_reports_user_id foreign key (user_id) references users (user_id);
        
ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_location_id foreign key (location_id) references locations (location_id);

ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_status foreign key (status) references status_types (status_id);
        
ALTER TABLE reports
ADD CONSTRAINT
        fk_reports_severity foreign key (severity) references severity_types (severity_id);
        
INSERT INTO severity_types (severity_id, severity_desc) 
        VALUES 
        (1, 'minor'), 
        (2, 'average'), 
        (3, 'major');
        
INSERT INTO status_types (status_id, status_desc) 
        VALUES 
        (1, 'reported'),
        (2, 'inspected'),
        (3, 'repaired');

INSERT INTO locations (street, city, district, zip) 
        VALUES 
        ('6902 Hollywood Blvd', 'Los Angeles', 'CA', 90028),
        ('1502 Market Street', 'Philadelphia', 'PA', 19102);
        
INSERT INTO reports (user_id, location_id, reported, status) 
        VALUES 
        ( 1, 1, '4/5/2021', 1),
        ( 1, 2, '4/6/2021', 1);
        

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
        