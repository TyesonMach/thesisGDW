create database TDM_CAREER_LO
go
use TDM_CAREER_LO

create table dim_competency(
	competencyId int,
	competencyName nvarchar(150),
	type nvarchar(150),
	primary key(competencyId)
)

create table dim_career(
	careerKey int,
	careerId int,
	careerName nvarchar(150),
	numpost int,
	createDate datetime,
	expiredDate datetime,
	rowStatus int,
	primary key(careerKey)
)

create table career_need_competency(
	careerKey int,
	competencyId int,
	numRequired int,
	primary key(careerKey, competencyId)
)


alter table career_need_competency add constraint career_have_competency_careerKey foreign key(careerKey) references dim_career(careerKey)

alter table career_need_competency add constraint career_have_competency_competencyId foreign key(competencyId) references dim_competency(competencyId)


DROP TABLE dbo.career_have_competency;
DROP TABLE dbo.dim_career;



