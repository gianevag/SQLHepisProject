/*-------------------------------------INSERT PROCEDURES---------------------------------------------*/
USE InformationCompany
GO

/*-------------------------------------CREATE MUNICIPALITIES AND PREFECTURE TABLE---------------------------------------------*/

CREATE PROCEDURE INSERT_PREFECTURE (@prefecture VARCHAR(20))
AS

IF (SELECT pref_name FROM Prefecture WHERE pref_name LIKE +'%' + @prefecture +'%') IS NULL

	INSERT INTO Prefecture(pref_name)
	VALUES (@prefecture);

GO

CREATE PROCEDURE INSERT_MUNICIPALITIES(@municipality VARCHAR(20), @prefecture VARCHAR(20))
AS

EXEC INSERT_PREFECTURE @prefecture

IF (SELECT mun_name FROM Municipality WHERE mun_name LIKE + '%' + @municipality +'%') IS NULL	
	
	INSERT INTO Municipality(mun_name, mun_pref)
	VALUES (@municipality, (SELECT pref_id FROM Prefecture WHERE pref_name=@prefecture)) 
GO


/*-------------------------------------CREATE EMPLOYEE TABLE---------------------------------------------*/

CREATE PROCEDURE INSERT_SPECIALY (@speciality VARCHAR(20))
AS

IF (SELECT spec_name FROM Speciality WHERE spec_name LIKE +'%' + @speciality +'%') IS NULL

	INSERT INTO Speciality(spec_name)
	VALUES (@speciality);

GO

CREATE PROCEDURE INSERT_PHONENUMBER_EMP(@fname VARCHAR(20),@sname VARCHAR(20),@phone VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Employee JOIN Phone_Employee ON PhoEmp_emp=emp_id WHERE PhoEmp_number = @phone) 
	
	INSERT INTO Phone_Employee(PhoEmp_number, PhoEmp_emp)
	VALUES(@phone,(SELECT emp_id from Employee WHERE emp_fname= @fname AND emp_sname=@sname));
		
GO

CREATE PROCEDURE INSERT_EMPLOYEE(@sname VARCHAR(20),@fname VARCHAR(20),@email VARCHAR(20),@phone VARCHAR(20),
				 @afm VARCHAR(20),@amka VARCHAR(20), @isContractor BIT, @salary DECIMAL(11,2), @datetime VARCHAR(8), @zip INT, @speciality NVARCHAR(20), @municipality NVARCHAR(20))
AS

EXEC INSERT_SPECIALY @speciality

IF NOT EXISTS (SELECT * FROM Employee WHERE emp_afm=@afm)

	INSERT INTO Employee(emp_fname, emp_sname, emp_email, emp_afm, emp_amka, emp_isContractor, emp_salary, emp_datetime, emp_zip, emp_spec, emp_mun)
	VALUES (@fname, @sname, @email, @afm, @amka, @isContractor, @salary,CONVERT(date,@datetime,5), @zip, 
	(SELECT spec_id FROM Speciality WHERE spec_name=@speciality), 
	(SELECT mun_id FROM Municipality WHERE mun_name=@municipality));	
	
EXEC INSERT_PHONENUMBER_EMP @fname, @sname, @phone

GO

/*-------------------------------------CREATE CLIENT TABLE---------------------------------------------*/

CREATE PROCEDURE INSERT_PHONENUMBER_CLIENT(@name VARCHAR(20),@phone VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Client JOIN Phone_Client ON PhoCl_cl=cl_id WHERE PhoCl_number = @phone) 
	
	INSERT INTO Phone_Client(PhoCl_number, PhoCl_cl)
	VALUES(@phone,(SELECT cl_id from Client WHERE cl_name=@name))
		
GO


CREATE PROCEDURE INSERT_CLIENT(@sname VARCHAR(20), @fname VARCHAR(20), @name VARCHAR(20), @email VARCHAR(20), @phone VARCHAR(20), @zip INT, @afm INT, @municipality NVARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Client WHERE cl_afm=@afm)

	INSERT INTO Client(cl_sname,cl_fname,cl_name, cl_email, cl_afm, cl_zip, cl_mun)
	VALUES (@sname, @fname, @name, @email, @afm, @zip, 
	(SELECT mun_id FROM Municipality WHERE mun_name=@municipality));

EXEC INSERT_PHONENUMBER_CLIENT @name, @phone

GO

/*-------------------------------------CREATE PROJECT TABLE---------------------------------------------*/

CREATE PROCEDURE INSERT_PHASE (@phase VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Phase WHERE phase_description=@phase)

	INSERT INTO Phase(phase_description)
	VALUES (@phase);

GO

CREATE PROCEDURE INSERT_CATEGORY(@category VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Category WHERE cat_name=@category)

	INSERT INTO Category(cat_name)
	VALUES (@category);

GO

CREATE PROCEDURE INSERT_TAG(@tag VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Tag WHERE tag_name=@tag)

	INSERT INTO Tag(tag_name)
	VALUES (@tag);

GO

CREATE PROCEDURE ADD_CATEGORY_PROJECT(@name VARCHAR(20), @category VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Category_Project ON CatPro_pro_id=pro_id) join Category ON cat_id = CatPro_cat_id WHERE pro_name=@name AND cat_name = @category )
	
	INSERT INTO Category_Project(CatPro_pro_id, CatPro_cat_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@name),(SELECT cat_id FROM Category WHERE cat_name=@category))

GO

CREATE PROCEDURE ADD_TAG_PROJECT(@name VARCHAR(20), @tag VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Tag_Project ON TagPro_pro_id=pro_id) join Tag ON tag_id = TagPro_tag_id WHERE pro_name=@name AND tag_name = @tag )
	
	INSERT INTO Tag_Project(TagPro_pro_id, TagPro_tag_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@name),(SELECT tag_id FROM Tag WHERE tag_name=@tag))

GO

CREATE PROCEDURE INSERT_PROJECT(@name VARCHAR(20), @detail VARCHAR(500), @cost DECIMAL(11,2), @price DECIMAL(11,2),@category VARCHAR(20), @tag VARCHAR(20), @client NVARCHAR(20))
AS

EXEC INSERT_CATEGORY @category
EXEC INSERT_TAG @tag

IF NOT EXISTS (SELECT * FROM Project WHERE pro_name=@name)

	INSERT INTO Project(pro_name, pro_detail, pro_cost, pro_price, pro_client)
	VALUES (@name, @detail, @cost, @price, 
	(SELECT cl_id FROM Client WHERE cl_name=@client));

EXEC ADD_CATEGORY_PROJECT @name, @category
EXEC ADD_TAG_PROJECT @name, @tag

GO

ALTER PROCEDURE ADD_EMPLOYEE_PROJECT(@sname VARCHAR(20), @fname VARCHAR(20), @project VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Employee_Project ON EmpPro__pro_id=pro_id) join Employee ON emp_id = EmpPro_emp_id WHERE emp_fname = @fname AND emp_sname = @sname AND pro_name = @project )
	
	INSERT INTO Employee_Project(EmpPro__pro_id, EmpPro_emp_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@project),(SELECT emp_id FROM Employee WHERE emp_fname = @fname AND emp_sname = @sname))

GO


ALTER PROCEDURE ADD_PHASE_PROJECT(@project VARCHAR(20), @phase VARCHAR(60), @datetime VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Project_Phase ON ProPhase_pro_id=pro_id) join Phase ON phase_id = ProPhase_phase_id WHERE phase_description = @phase AND pro_name = @project)
	
	INSERT INTO Project_Phase(ProPhase_phase_id, ProPhase_pro_id, ProPhase_datetime)
	VALUES((SELECT phase_id FROM Phase WHERE phase_description = @phase), (SELECT pro_id FROM Project WHERE pro_name=@project), CONVERT(date,@datetime,5))

GO
