1--
select * from Employee

2--
select Fname ,Lname ,Dno 
from Employee

3--
select pname , plocation ,Dname
from project
inner join departments on project.dnum =departments.dnum

4--
select fname +' '+ lname as [full name ] , salary*10/100 as ANNUAL_COMM  
from Employee

5--
select ssn , fname +' '+ lname as [full name ]
from Employee
where Salary>1000

6--
select ssn , fname +' '+ lname as [full name ]
from Employee
where Salary*12>10000

7--
select fname +' '+ lname as [full name ] , salary  
from Employee
where sex ='F'

8--
select dnum , dname 
from Departments
inner join Employee on Employee.Dno = departments.dnum
where ssn = 968574

9--
select pnumber , pname , plocation 
from project 
where dnum = 10

10--
select dnum , dname , ssn ,fname +' '+ lname as [manager name ]
from Departments
inner join Employee on Employee.Dno = departments.dnum

11--
select dname , pname 
from Departments
inner join Project on project.dnum =departments.dnum

12--***
select Dependent.* , Employee.fname +' '+ lname as [parent name ]  
from Dependent
inner join Employee on Employee.SSN = Dependent.ESSN


select fname +' '+ lname as [parent name ]  ,Dependent_name , Sex , Bdate
from Dependent
inner join Employee on Employee.SSN = Dependent.ESSN


13--
select pnumber , pname , plocation 
from project 
where city  in('cairo','alex' )

14--
select * from Project
where Pname like 'a%'

15--
select fname +' '+ lname as [full name ]  
from Employee
inner join Departments on Employee.SSN = departments.MGRSSN
where Dnum = 30
and Salary between 1000 and 2000

16--
select fname +' '+ lname as [full name ]  
from Employee
inner join Works_for on Employee.SSN = Works_for.ESSn
inner join Project on Project.Pnumber = Works_for.Pno
where Dno =10
and Hours>=10
and Pname ='AL RABWAH'




17--*********
select super.  fname as s_fname , super .Lname as s_lname
from  Employee  ee, Employee super 
where super.SSN = ee .superssn  
 and super. fname ='kamel' and super. lname= 'mohamed'


 18--
select fname , lname , pname 
from Employee 
inner join Works_for on Employee.SSN = Works_for.ESSn
inner join Project on Project.Pnumber = Works_for.Pno
order by Pname



19--

select Pnumber ,dname , Lname as manger_lastname , Address ,bdate 
 from Departments
inner join Project on project.dnum =departments.dnum
inner join Employee on Employee.SSN = departments.MGRSSN
where City like '%cairo%'

20--**********
select  ma . fname as managers 
from Employee ee,Employee ma
where ma.SSN = ee .Superssn


select Employee. *
from Employee
inner join Departments on Employee.Dno = departments.Dnum


21--
select * from Employee
left join Dependent on Employee.SSN = Dependent.ESSN



---------DML-------------

1--
insert into Employee
values('salma','saad','102672','1965-01-01 00:00:00.000','helwan','f',3000,112233,30)

2--
insert into Employee
(Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values('aya','ahmed','102660','1965-01-01 00:00:00.000','tanta','f',30)

3--
update Employee set Salary=Salary+(Salary*20/100)
where Fname ='salma '




---------------D4--------------------

1--

select fname , lname  , pname , sum (hours) as sum_h
from Employee 
inner join Works_for on Employee.SSN = Works_for.ESSn
inner join Project on Project.Pnumber = Works_for.Pno
group by Pname , Fname , Lname

2--
select Departments. * 
from Employee
inner join Departments on Employee.Dno = departments.Dnum
where SSN = (select  min (ssn) from Employee)

3--
select ssn as e_num , dname , min(salary ) as min , max(salary ) as max ,avg(salary ) as avg
from Employee
inner join Departments on Employee.Dno = departments.Dnum
group by ssn , Dname

4--
select lname 
from Employee
where SSN in (select mgrssn from Departments)
and SSN not in (select essn from Dependent)

5--
select dnum ,dname , count(SSN ) as count_ssn 
from Employee
inner join Departments on Employee.Dno = departments.Dnum
group by dnum , dname
having avg( Employee . salary) < (select avg (salary) from Employee)

6--
select fname , pname
from Departments
inner join Project on project.dnum =departments.dnum
inner join Employee on Employee.SSN = departments.MGRSSN
order by Fname , lname,Departments .Dnum

7--
update Employee set Salary=Salary+(Salary*30/100)
where ssn in (select mgrssn from Departments where Dname ='AL RABWAH')

8--
select ssn as E_num , fname +' '+ lname as [full name ]  
from Employee
where SSN  in (select essn from Dependent)



---------------------------D5-----------------

1--
create view v1 
as
select st_fname , st_lname , crs_name 
from Student
inner join Stud_Course on Student.St_Id = Stud_Course.St_Id
inner join Course on Stud_Course.Crs_Id= Course.Crs_Id
where grade > 50


2--2t
create view v24
with encryption 
as
select D .Dept_Manager , I .Ins_Name ,  T .Top_Name
from Department D , Instructor I , Ins_Course IC , course C , topic T  
where D . Dept_Manager = I .Ins_Id 
and I . ins_id = IC . ins_id
and IC . crs_id = C. crs_id 
and c. Top_Id = T .Top_Id
 
 
create view vvvvv
with encryption 
as
select Dept_Manager ,Ins_Name , Top_Id
from Department
inner join Instructor on Department. dept_manager = Instructor . ins_id 
inner join Ins_Course on Ins_Course .Ins_Id = Instructor . ins_id 
inner join Course on Ins_Course .Crs_Id= Course.Crs_Id
inner join Topic on Topic.Top_Id= Course.Top_Id

select * from vvvvv
3--
create view vv7
as
select ins_name ,dept_name
from Department 
inner join Instructor on Department. dept_manager = Instructor . ins_id
where Dept_Name in ('sd','java')

4--
create view vrr
as
select *from Student
where [St_Address] in ('alex' , 'cairo')
with check option 

 Update vrr set st_address='tanta'  Where st_address=’alex’

 5--
create table #l_tabel
 (
 emp_name varchar (50) not null, 
 today_task varchar (100)
 )

 -----part 2-------
 1--
create view vkk
as
select Pname , ssn as e_num 
from Project
inner join Departments on Departments.Dnum= Project.Dnum
inner join Employee on Departments.Dnum =Employee.Dno

2--
create view v_D30 as 
select ee . ssn as e_num ,pp.Pnumber  ,ww.Hours  as H_project 
from Employee ee , Works_for ww , Project pp 
where ee.SSN = ww.ESSn
and ww.Pno= pp.Pnumber
and pp.Dnum =30

3-- 
create view vv_count as 
select Pname ,sum ( Hours ) as summ_hour
from Project
inner join Works_for on Works_for.Pno=Project.Pnumber       
group by Pname

create view v1_count as 
select Pname , Hours  
from Project
inner join Works_for on Works_for.Pno=Project.Pnumber


4--
create view v_project_500 as 
select * from v_D30
where Pnumber =500

6--
 create view v_without_budget as 
 select * from Project

alter view v_without_budget as 
select * from Project
where Pnumber in (300,400)

7--
drop view v_D30,v1_count

---------------------const,roule,DT------------

1--
create rule r11 as @x > 1000

sp_bindrule r11 ,'employee.salary'

2--!!!!!!!!!!!!!!
create type loc From nchar (2)

create default d1 as 'ny'

sp_bindefault d1 , loc

create rule r1 as @pp in ( 'ny','ds','kw')             


sp_bindrule r1 , loc


3--  
create table newstudent
(
id int , 
OT loc
)



-----------------d6------------------
1---------

create function  g (@date date)
returns varchar(10)
  begin 
		declare @m varchar(10)
	
		select @m= FORMAT (@date,'MMMM') 
		return @m
  end 

select convert (date ,1/12/2009)


select dbo.g('1/12/2009')

2---------------
create function Getn(@f int , @s int)
returns table
as 
return 
(
  select St_Id , St_Fname +' '+ St_Lname as nsme
  from Student
  where St_Id between @f and @s
)

select * from Getn(5 , 6)


 3--
create function f_st( @id int)
returns table
as 
return 
(
  select Dept_Name , St_Fname +' '+ St_Lname as fff
  from Student
  inner join Department on Department.Dept_Id= Student.Dept_Id
  where St_Id = @id
)

select * from f_st  (5)

4--
create function p(@s_id int)
returns nvarchar(100)
as
begin 
      declare @a nvarchar(50) , @b nvarchar(50),@c nvarchar(50)
       select @b= Student.St_Fname,@c=Student.St_Lname
       from Student where Student.St_Id=@s_id
      set @a =
   case
	 when  @b is null then 'first name is null'
	 when  @c is null then 'last name is null'
	 when  @b is null and   @c is null then 'First name & last name are  null'
	 else 'First name & last name are not null'
     end
return @a
end
select  dbo.p(13)

5----
create function d(@dd int)
returns table 
as
return 
(select ee.Dept_Name,ii.Ins_Name, CONVERT(date,ee.Manager_hiredate,@dd ) AS h
from Department ee ,Instructor ii
where ii.Ins_Id=ee.Dept_Manager 
)
select * from dbo.d(4)

6--

create function NN(@bb varchar(100))
returns @t table (num varchar(100))
as
begin 
          if(@bb='first name')
          	insert into @t
	        select isnull(St_Fname,'Null first name') from Student

          else if (@bb='last name')
	        insert into @t
        	select isnull(St_Lname,'Null last name') from Student

          else if (@bb='full name')
         	insert into @t
	        select isnull(St_Fname,'Null first name')+' '+isnull(Student.St_Lname,'null_last name')from Student
	          
return
end

select * from dbo.NN('full name')








7--supsting 

select St_Id,
SUBSTRING(St_Fname, 1 ,len (St_Fname)-1)
from Student



--------part 2---------
1--
create function vv(@cc int)
returns table 
as
return 
(
select ee.Fname,pp.Pnumber
from Employee ee ,Works_for ww ,Project pp
where pp.Pnumber=ww.Pno
and ee.SSN=ww.ESSn 
and pp.Pnumber=@cc
)
 select * from dbo.vv(65)