BEGIN TRANSACTION;

DROP TABLE IF EXISTS damage_claim;
DROP TABLE IF EXISTS reports;
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
INSERT INTO users (username,password_hash,role) VALUES ('SouthPhillyGirl','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('ThisIsGritty','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('ChzSteakChamp','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('BenFranklinSim25','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('SwoopSwoopFly09','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('JawnBawnJovi','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');



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

CREATE TABLE damage_claim
(
        damage_claim_id serial,
        report_id int,
        full_name varchar(100),
        phone_number varchar(32), 
        email varchar(100),
        address varchar(100),
        incident_date varchar(64),
        car varchar(64),
        damage_description varchar(400),
        
        constraint pk_damage_claim primary key (damage_claim_id)
);

/**
ALTER TABLE damage_claim
ADD CONSTRAINT
        fk_damage_claim_report_id foreign key (report_id) references reports (report_id);
**/

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
        ( 'JohnnyQPublic', 39.92749552614909, -75.16582461072275, '1800 S Camac St, Philadelphia, PA 19148', 'Could bust a tire', '4/5/2021, 9:03:20 AM', 1, 0),
        ( 'SouthPhillyGirl', 39.92646525024146, -75.15076316471925, '244 Watkins St, Philadelphia, PA 19148', 'Minor', '4/6/2021, 5:13:20 PM', 1, 0),
        ( 'ThisIsGritty', 39.93311326475592, -75.1589863105424, '1283 S 9th St, Philadelphia, PA 19147', 'Do not drive over me', '4/7/2021, 8:13:20 AM', 1, 0),
        ( 'ChzSteakChamp', 39.93688680567627, -75.18882593628159, '2673 Wharton St, Philadelphia, PA 19146', 'Minor', '4/8/2021, 2:30:19 PM', 1, 0),
        ( 'BenFranklinSim25', 39.961670590112604, -75.15602882276968, '1034 Spring Garden St, Philadelphia, PA 19123', 'Do not drive over me', '4/9/2021, 8:13:20 AM', 1, 0),
        ( 'SwoopSwoopFly09', 39.9826454810186, -75.18836681957112, '33rd St & Cecil B Moore Av, Philadelphia, PA 19121', 'New route advised', '4/10/2021, 7:45:12 AM', 1, 0),
        ( 'JawnBawnJovi', 39.97032828538133, -75.13011447561469, '411 E Girard Ave, Philadelphia, PA 19125', 'Catastrophic', '4/11/2021, 8:13:20 AM', 1, 0);
        
        
        
        
INSERT INTO damage_claim (report_id, full_name, phone_number, email, address, incident_date, car, damage_description) 
        VALUES (1, 'Johnny Q Public', '215-555-5555', 'bandit@jmail.com', '123 Fake Street Philadelphia PA 19147', '4/5/2021', 'Toyota Corolla', 'Damage to the front passenger side wheel and axle');

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