use db06tms170_1718
sp_helptext viewdetails_project

select * from tblsubscriber_team6
sp_help tblsubscriber_team6


create table mytable_project
(id int identity(1000,1) primary key,
 s_id varchar(50),
 pass varchar(20),
 ssn bigint,
 sim_no bigint,
 name varchar(30),
 age int,
 contact bigint,
 email varchar(30),
 addr varchar(20),
 city varchar(20),
 pincode int,
 status1 varchar(10) not null default 'Active',
 last_upd datetime default getdate(),
 balance int )

  drop  table mytable_project

create procedure add_subscriber_project
@id int out,
@name varchar(20),
@ssn bigint,
@sim_no bigint,
@age int,
@contact bigint,
@email varchar(20),
@addr varchar(20),
@city varchar(20),
@pincode int,
--@last_upd date,
@balance int
as 
begin
declare @s_id varchar(50)
declare @pass varchar(50)
insert into mytable_project(s_id,pass,ssn,sim_no,name,age,contact,email,addr,city,pincode,balance)
values(@s_id,@pass,@ssn,@sim_no,@name,@age,@contact,@email,@addr,@city,@pincode,@balance)
set @id=@@IDENTITY
set @s_id='SUBID00'+convert(varchar(30),@id)
print @s_id
set @pass='Pass@'+convert(varchar(20),@id)
update mytable_project
set s_id=@s_id,
pass=@pass
where id=@id
end



drop procedure add_subscriber_project


create procedure viewdetails_project2
as
begin
select s_id,name,ssn,sim_no,age,contact,email,addr,city,pincode,status1,last_upd,balance 
from mytable_project
end

drop procedure  
execute viewdetails_project


alter procedure updatedetails_project
@sid varchar(20),
@name varchar(20),
@sim_no bigint,
@age int,
@contact bigint,
@email varchar(20),
@addr varchar(20),
@city varchar(20),
@pincode int,
@last_upd date,
@balance int
 as
begin
update mytable_project1
set name=@name,
sim_no=@sim_no ,
age=@age ,
contact=@contact ,
email=@email,
addr=@addr ,
city=@city,
pincode=@pincode,
last_upd=getdate(),
balance=@balance
where s_id=@sid;
end

drop procedure updatedetails_project1

select *
from mytable_project

alter procedure delete_subscriber
@sid varchar(20)
as
begin
select *
from mytable_project
where s_id=@sid
--delete 
--from mytable_project
--where s_id=@sid
update mytable_project
set status1='DELETED'
where s_id=@sid
end


create procedure delete_subscriber1
@sid varchar(20)
as
begin
select *
from tblsubscriber_team6
where subid=@sid
update tblsubscriber_team6
set status='DELETED'
where subid=@sid
end

select* 
from tblsubscriber_team6 

select* 
from tbluserstore_team6
