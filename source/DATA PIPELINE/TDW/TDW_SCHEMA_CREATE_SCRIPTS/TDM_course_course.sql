create database TDM_COURSE_COURSE
go
use TDM_COURSE_COURSE
go

create table course_to_course(
	course_source_key int,
	course_target_key int,
)

select * from course_to_course