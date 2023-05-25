create database TDM_USER_LO
go
use TDM_USER_LO
go

create table dim_competency(
	competencyId int,
	competencyName nvarchar(150),
	type nvarchar(150),
	primary key(competencyId)
)

create table dim_user(
	userId int,
	userName nvarchar(150),
	email nvarchar(150),
	primary key(userId)
)

create table fact_user(
	userId int,
	competencyId int,
	careerId int
	primary key(userId, competencyId, careerId)
)

alter table fact_user add constraint FK_fact_user_userId foreign key(userId) references dim_user(userId)

alter table fact_user add constraint FK_fact_user_competency foreign key(competencyId) references dim_competency(competencyId)

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
