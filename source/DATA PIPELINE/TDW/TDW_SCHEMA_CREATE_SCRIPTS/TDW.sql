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
	courseName nvarchar(1000),
	enroll int,
	rating float,
	fee nvarchar(150),
	time nvarchar(150),
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

create table dim_career(
	careerId int,
	careerName nvarchar(150),
	primary key(careerId)
)

create table dim_user(
	userId int,
	userName nvarchar(150),
	email nvarchar(150),
	primary key(userId)
)

create table fact_course(
	courseKey int,
	competencyId int,
	is_require int,
	primary key(courseKey, competencyId)
)

create table fact_jobposting(
	jobKey int,
	jobpostDate datetime,
	careerId int,
	competencyId int,
	primary key(jobKey, jobpostdate, careerId, competencyId)
)

create table fact_user(
	userId int,
	competencyId int,
	careerId int
	primary key(userId, competencyId, careerId)
)

alter table bridge_instructor_course add constraint FK_bridge_courseKey foreign key(courseKey) references dim_course(courseKey)

alter table bridge_instructor_course add constraint FK_brige_instructorId foreign key(instructorId) references dim_instructor(instructorId)

alter table dim_course add constraint FK_course_website foreign key(websiteId) references dim_website(websiteId)

alter table dim_course add constraint FK_course_level foreign key(levelId) references dim_level(levelId)

alter table bridge_language_course add constraint FK_brige_languageId foreign key(languageId) references dim_language(languageId)

alter table fact_course add constraint FK_fact_courseKey foreign key(courseKey) references dim_course(courseKey)

alter table fact_course add constraint FK_fact_competency foreign key(competencyId) references dim_competency(competencyId)

alter table fact_jobposting add constraint FK_jobposting_careerId foreign key(careerId) references dim_career(careerId)

alter table fact_jobposting add constraint FK_jobposting_competencyId foreign key(competencyId) references dim_competency(competencyId)

alter table fact_user add constraint FK_fact_user_userId foreign key(userId) references dim_user(userId)

alter table fact_user add constraint FK_fact_user_competency foreign key(competencyId) references dim_competency(competencyId)

alter table fact_user add constraint FK_fact_user_career foreign key(careerId) references dim_career(careerId)


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

