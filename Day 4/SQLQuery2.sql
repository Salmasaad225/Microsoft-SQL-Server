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