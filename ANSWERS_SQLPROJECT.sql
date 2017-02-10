USE InformationCompany
GO

/*ΕΡΩΤΗΜΑ 1*/
SELECT cl_fname,cl_sname,cl_afm 
FROM (Client JOIN Municipality ON cl_mun=mun_id) JOIN Prefecture ON pref_id=mun_pref
WHERE pref_name='ΑΤΤΙΚΗΣ'

/*ΕΡΩΤΗΜΑ 2*/
SELECT cl_fname,cl_sname,cl_afm 
FROM (Client JOIN Municipality ON cl_mun=mun_id) JOIN Prefecture ON pref_id=mun_pref
WHERE pref_name !='ΑΤΤΙΚΗΣ' OR mun_name='ΑΘΗΝΩΝ'

/*ΕΡΩΤΗΜΑ 3*/
SELECT emp_fname,emp_sname,emp_salary
FROM Employee
WHERE datepart(YY,emp_datetime)>=05 AND datepart(MM,emp_datetime)>=01 AND datepart(DD,emp_datetime)>=01 AND emp_isContractor != 0

/*ΕΡΩΤΗΜΑ 4*/
SELECT pro_name,pro_detail
FROM Project JOIN Client ON pro_client=cl_id 
WHERE cl_name='STAR'

/*ΕΡΩΤΗΜΑ 5*/
SELECT pro_name
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id
WHERE phase_description = 'ΑΚΥΡΩΣΗ'

/*ΕΡΩΤΗΜΑ 6*/
SELECT DISTINCT cl_name
FROM  Client JOIN Project ON cl_id=pro_client
WHERE pro_cost >= 5000

/*ΕΡΩΤΗΜΑ 7*/
SELECT pro_name,phase_description,ProPhase_datetime
FROM
(
SELECT pro_id,pro_name,MAX(ProPhase_datetime) AS MAXDATE
FROM ((((Project JOIN Category_Project ON CatPro_pro_id = pro_id) JOIN Category ON cat_id=CatPro_cat_id)
JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id)
WHERE cat_name = 'ANDROID APP' AND GETDATE()>=ProPhase_datetime AND phase_description != 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ'
GROUP BY pro_id,pro_name

INTERSECT

SELECT pro_id,pro_name, MAX(ProPhase_datetime) AS MAXDATE
FROM ((((Project JOIN Category_Project ON CatPro_pro_id = pro_id) JOIN Category ON cat_id=CatPro_cat_id)
JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id)
WHERE cat_name='WEB SITE' AND GETDATE()>=ProPhase_datetime AND phase_description != 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ'
GROUP BY pro_id,pro_name

)V,Phase,Project_Phase
WHERE V.pro_id=ProPhase_pro_id AND V.MAXDATE=ProPhase_datetime AND phase_id=ProPhase_phase_id

/*ΕΡΩΤΗΜΑ 8*/
SELECT SUM(pro_cost) AS COST
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id
WHERE phase_description='ΑΝΑΘΕΣΗ' AND ProPhase_datetime BETWEEN '20161001' AND '20161030'

/*ΕΡΩΤΗΜΑ 9*/
SELECT pro_name,pro_cost
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id
WHERE phase_description='ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ' AND ProPhase_datetime BETWEEN '20161001' AND '20161030'

EXCEPT

SELECT pro_name,pro_cost
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id
WHERE phase_description='ΠΑΡΑΔΟΣΗ' AND ProPhase_datetime BETWEEN '20161001' AND '20161030'

/*ΕΡΩΤΗΜΑ 10*/
SELECT TOP(5) cl_name, SUM(pro_cost) AS cost
FROM Client JOIN Project ON pro_client=cl_id 
GROUP BY cl_name
ORDER BY cost DESC

/*ΕΡΩΤΗΜΑ 11*/
SELECT COUNT(pro_name)
FROM Project JOIN Employee_Project ON pro_id=EmpPro__pro_id JOIN Employee ON EmpPro_emp_id=emp_id JOIN Project_Phase ON ProPhase_pro_id=pro_id
WHERE emp_fname = 'ΠΕΤΡΟΣ' AND emp_sname = 'ΑΛΕΞΙΟΥ' and ProPhase_phase_id=4

/*ΕΡΩΤΗΜΑ 12*/
SELECT spec_name, COUNT(pro_name) AS NUMBER_OF_PROJECT
FROM (((Project JOIN Employee_Project ON pro_id=EmpPro__pro_id) JOIN Employee ON EmpPro_emp_id=emp_id)
JOIN Speciality ON spec_id=emp_spec)
WHERE emp_isContractor = 0
GROUP BY spec_name

/*ΕΡΩΤΗΜΑ 13*/
SELECT distinct pro_id, pro_name, pro_detail, ProPhase_datetime
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id JOIN Tag_Project ON TagPro_pro_id = pro_id JOIN Tag on TagPro_tag_id=tag_id
WHERE
tag_name in
(SELECT tag_name FROM (SELECT TOP(1) pro_id, pro_name, pro_detail, ProPhase_datetime
FROM (Project JOIN Project_Phase ON pro_id = ProPhase_pro_id) JOIN Phase ON phase_id = ProPhase_phase_id
WHERE phase_description='ΠΑΡΑΔΟΣΗ' AND GETDATE() > ProPhase_datetime
ORDER BY ProPhase_datetime DESC)V JOIN Tag_Project ON TagPro_pro_id = pro_id JOIN Tag on TagPro_tag_id=tag_id)
and phase_description='ΠΑΡΑΔΟΣΗ'

/*ΕΡΩΤΗΜΑ 14*/
SELECT emp_fname, emp_sname, emp_email, emp_afm, emp_amka, emp_isContractor, emp_salary, emp_datetime, emp_zip 
FROM Employee JOIN Employee_Project ON EmpPro_emp_id=emp_id JOIN Project on EmpPro__pro_id=pro_id
JOIN Tag_Project ON TagPro_pro_id = pro_id JOIN Tag ON tag_id=TagPro_tag_id
WHERE (tag_name like '%WEB%') AND emp_isContractor = 1 

INTERSECT

SELECT emp_fname, emp_sname, emp_email, emp_afm, emp_amka, emp_isContractor, emp_salary, emp_datetime, emp_zip 
FROM Employee JOIN Employee_Project ON EmpPro_emp_id=emp_id JOIN Project on EmpPro__pro_id=pro_id
JOIN Tag_Project ON TagPro_pro_id = pro_id JOIN Tag ON tag_id=TagPro_tag_id
WHERE (tag_name like '%PHP%') AND emp_isContractor = 1 

/*ΕΡΩΤΗΜΑ 15*/
SELECT tag_name FROM (SELECT tag_name, COUNT(pro_name) AS number_of_project
FROM Tag JOIN Tag_Project ON tag_id=TagPro_tag_id JOIN Project ON pro_id=TagPro_pro_id
group by tag_name)V
WHERE V.number_of_project>=10

/*ΕΡΩΤΗΜΑ 16*/
SELECT B.emp_sname,B.emp_fname
FROM (SELECT V.emp_sname,V.emp_fname,COUNT(V.cat_name) AS COUNT_category
FROM (SELECT distinct emp_sname,emp_fname,cat_name
FROM Employee JOIN Employee_Project ON emp_id=EmpPro_emp_id JOIN Project ON pro_id=EmpPro__pro_id 
JOIN Category_Project on CatPro_pro_id=pro_id join Category on cat_id=CatPro_cat_id)V
GROUP BY V.emp_sname, V.emp_fname)B
WHERE B.COUNT_category = (SELECT COUNT(cat_name) FROM Category)

/*ΕΡΩΤΗΜΑ 17*/
SELECT emp_fname as fname,emp_sname as sname
FROM Employee
WHERE emp_fname='ΔΗΜΗΤΡΙΟΣ'
UNION
SELECT cl_fname as fname,cl_sname as sname
FROM Client
WHERE cl_fname='ΔΗΜΗΤΡΙΟΣ'

/*ΕΡΩΤΗΜΑ 18*/
SELECT emp_sname, emp_fname
FROM Project join  Employee_Project on pro_id=EmpPro__pro_id join Employee on emp_id=EmpPro_emp_id
join Project_Phase on pro_id=ProPhase_pro_id join Category_Project on CatPro_pro_id=pro_id 
join Category on cat_id=CatPro_cat_id
WHERE ProPhase_datetime BETWEEN '20160101' AND '20160630' AND ProPhase_phase_id=4 and emp_isContractor=0
and cat_name not in 
(SELECT cat_name 
FROM  Project join Project_Phase on pro_id=ProPhase_pro_id join Category_Project on CatPro_pro_id=pro_id 
join Category on cat_id=CatPro_cat_id
WHERE ProPhase_datetime BETWEEN '20161001' AND '20161030' AND ProPhase_phase_id=2)

/*ΕΡΩΤΗΜΑ 19*/
alter procedure ContractorMoney (@date nvarchar(20))
as 
begin

	declare @amount float
	declare @contr_salary float
	declare @contr INT
	declare @pro_number int
	declare @count_contr int

	declare db_cursor CURSOR FOR
select emp_id from Employee where emp_isContractor = 0
set @amount = 0
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @contr
WHILE @@FETCH_STATUS = 0   
BEGIN   
	
	set @amount = (select sum(pro_cost)from Project join  [dbo].[Employee_Project] on pro_id=EmpPro__pro_id join [dbo].[Project_Phase] on [ProPhase_pro_id]=pro_id
					where EmpPro_emp_id=@contr and [ProPhase_phase_id]=4 and
					datepart(MM,[ProPhase_datetime])=datepart(MM,convert(date,@date,5)) and
					datepart(YY,[ProPhase_datetime])=datepart(YY,convert(date,@date,5)))
	
	set @count_contr = (select COUNT(emp_id) 
					 from Employee join Employee_Project on emp_id=EmpPro_emp_id join Project on pro_id=EmpPro__pro_id 
					 join Project_Phase on ProPhase_pro_id=pro_id
					 where emp_isContractor = 0 and ProPhase_phase_id=4 
					 and EmpPro_emp_id=@contr and 
					 datepart(MM,[ProPhase_datetime])=datepart(MM,convert(date,@date,5)) and
					 datepart(YY,[ProPhase_datetime])=datepart(YY,convert(date,@date,5))
					 group by EmpPro_emp_id)

	set @contr_salary = @amount*0.20/@count_contr 

	set @pro_number = (select count(pro_cost)from Project join  [dbo].[Employee_Project] on pro_id=EmpPro__pro_id join [dbo].[Project_Phase] on [ProPhase_pro_id]=pro_id
					where EmpPro_emp_id=@contr and [ProPhase_phase_id]=4 and
					datepart(MM,[ProPhase_datetime])=datepart(MM,convert(date,@date,5)) and
					datepart(YY,[ProPhase_datetime])=datepart(YY,convert(date,@date,5)))
	
					IF (@pro_number >= 4)
						
					set	@contr_salary = @contr_salary + 200
					

					IF (@contr_salary<1200)
						
					set	@contr_salary = @contr_salary - @contr_salary*0.20

					ELSE

					set	@contr_salary = @contr_salary - @contr_salary*0.25

					UPDATE Employee
					SET emp_salary = @contr_salary
					WHERE emp_id = @contr


	FETCH NEXT FROM db_cursor INTO @contr
END  
CLOSE db_cursor
DEALLOCATE db_cursor
END

SELECT emp_fname,emp_sname,emp_salary FROM Employee where emp_isContractor = 0 and emp_salary is not NULL;

GO

ContractorMoney '01-10-16'
GO

/*ΕΡΩΤΗΜΑ 20*/
CREATE TRIGGER CANCELTRG ON Project_Phase
FOR INSERT
AS
	DECLARE @cancelDatetime DATETIME
	DECLARE @cancel_project INT
	DECLARE @phase int
	
	SELECT @cancelDatetime =i.ProPhase_datetime FROM inserted i;	
	SELECT @phase = i.ProPhase_phase_id FROM inserted i;	
	SELECT @cancel_project =i.ProPhase_pro_id FROM inserted i;

	IF(@phase=6)
		
		INSERT INTO Cancel(cancel_datetime,cancel_project)
		VALUES(@cancelDatetime,@cancel_project)
		PRINT 'CANCEL trigger fired.'	
GO

/*TEST TRIGGER*/
INSERT_PROJECT 'PROJECT9','DETAILS OF PROJECT9',1000,2000,'WINDOWS APP','C#','BLUELINES'
GO
ADD_PHASE_PROJECT 'PROJECT9', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '11-09-16'
GO
ADD_PHASE_PROJECT 'PROJECT9', 'ΑΚΥΡΩΣΗ', '17-09-16'
GO