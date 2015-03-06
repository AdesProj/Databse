drop table if exists learners;
create table learners(
learner_id int(6) primary key not null,
learner_first_name varchar(35) not null,
learner_last_name varchar(35) not null,
learner_other_names varchar(35),
learner_training_interests varchar(255),
specific_interests varchar(255),
course_choice_id integer(6) not null,
description_of_interest varchar(355) not null,
existing_training varchar(1) not null,
current_expected_job varchar(255))ENGINE=InnoDB;

drop table if exists course_choice;
create table course_choice(
course_choice_id int(6) primary key not null,
course_title varchar(100),
course_duration varchar(100))ENGINE=InnoDB;

drop table if exists providers;
create table providers(
provider_id int(6) primary key not null,
provider_first_name varchar(35) not null,
provider_last_name varchar(35) not null,
course_id int(6) not null,
provider_degree varchar(50) not null,
provider_office_hours int(10) not null,
provider_course_taught varchar(50) not null)ENGINE=InnoDB;

drop table if exists courses;
create table courses(
course_id int(6) primary key not null,
course_title varchar(100) not null,
subject_domain varchar(75),
course_duration varchar(100) not null,
course_start_date date not null,
course_end_date date not null,
course_cost double(4,2) not null,
course_requirments varchar(500) not null,
course_info_id int(6) not null)ENGINE=InnoDB;

drop table if exists course_info;
create table course_info(
course_info_id int(6) primary key not null,
negotiable_course_duration varchar(100) not null,
course_delivery_method varchar(255),
course_placement_option varchar(1) not null,
course_content_summary varchar(355) not null,
course_accreditation_level varchar(100),
course_assessment_method varchar(255),
cert_prog_route varchar(255),
course_objectives varchar(355),
course_benefits varchar(255))ENGINE=InnoDB;

drop table if exists provider_login;
create table provider_login(
provider_login_id int(6) primary key not null,
provider_id int(6)  not null,
provider_first_name varchar(35) not null,
provider_last_name varchar(35) not null,
provider_username varchar(16) not null,
provider_password varchar(18) not null)ENGINE=InnoDB;

drop table if exists learner_login;
create table learner_login(
learner_login_id int(6) primary key not null,
learner_id int(6) not null,
learner_first_name varchar(35) not null,
learner_last_name varchar(35) not null,
learner_username varchar(16) not null,
learner_password varchar(18) not null)ENGINE=InnoDB;

drop table if exists person;
create table person(
person_id int(6) primary key not null,
person_first_name varchar(20),
person_last_name varchar(50),
provider_id int(6) not null,
learner_id int(6) not null,
course_id int(6) not null)ENGINE=InnoDB;

alter table learners 
add constraint fk_learner_coursechoice foreign key (course_choice_id) references course_choice(course_choice_id);

alter table providers
add constraint fk_provder_courses foreign key (course_id) references courses(course_id);

alter table courses
add constraint fk_course_courseinfo foreign key (course_info_id) references course_info(course_info_id);

alter table provider_login
add constraint fk_plogin_provider foreign key (provider_id) references providers(provider_id);

alter table learner_login
add constraint fk_llogin_learner foreign key (learner_id) references learners(learner_id);

alter table person
add constraint fk_person_provider foreign key (provider_id) references providers(provider_id),
add constraint fk_person_learner foreign key (learner_id) references learners(learner_id),
add constraint fk_person_course foreign key (course_id) references courses(course_id);

