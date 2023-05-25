create database TDM_LO_COURSE
go
use TDM_LO_COURSE
go

create table dim_instructor(
	instructorId int,
	instructorName nvarchar(150),
	primary key(instructorId)
)

create table bridge_instructor_course(
	courseKey int,
	instructorId int,
	primary key(courseKey, instructorId)
)

create table dim_website(
	websiteId int,
	websiteName nvarchar(150),
	primary key(websiteId)
)

create table dim_level(
	levelId int,
	levelName nvarchar(150)
	primary key(levelId)
)

create table dim_language(
	languageId int,
	languageName nvarchar(150)
	primary key(languageId)
)

create table bridge_language_course(
	languageId int,
	courseKey int,
	primary key(languageId, courseKey)
)

create table dim_course(
	courseKey int,
	courseId int,
	courseName nvarchar(150),
	enroll int,
	rating float,
	fee int,
	time int,
	link nvarchar(1000),
	levelId int,
	websiteId int,
	createDate datetime,
	expiredDate datetime,
	rowStatus int,
	primary key(courseKey)
)


create table dim_competency(
	competencyId int,
	competencyName nvarchar(150),
	type nvarchar(150),
	primary key(competencyId)
)


create table fact_course(
	courseKey int,
	competencyId int,
	primary key(courseKey, competencyId)
)

alter table bridge_instructor_course add constraint FK_bridge_courseKey foreign key(courseKey) references dim_course(courseKey)

alter table bridge_instructor_course add constraint FK_brige_instructorId foreign key(instructorId) references dim_instructor(instructorId)

alter table dim_course add constraint FK_course_website foreign key(websiteId) references dim_website(websiteId)

alter table dim_course add constraint FK_course_level foreign key(levelId) references dim_level(levelId)

alter table bridge_language_course add constraint FK_brige_languageId foreign key(languageId) references dim_language(languageId)

alter table fact_course add constraint FK_fact_courseKey foreign key(courseKey) references dim_course(courseKey)

alter table fact_course add constraint FK_fact_competency foreign key(competencyId) references dim_competency(competencyId)


DROP TABLE dbo.bridge_instructor_course;
DROP TABLE dbo.bridge_language_course;
DROP TABLE dbo.dim_career;
DROP TABLE dbo.dim_competency;
DROP TABLE dbo.dim_course;
DROP TABLE dbo.dim_instructor;
DROP TABLE dbo.dim_language;
DROP TABLE dbo.dim_level;
DROP TABLE dbo.dim_user;
DROP TABLE dbo.dim_website;
DROP TABLE dbo.fact_course;
DROP TABLE dbo.fact_jobposting;
DROP TABLE dbo.fact_user;


