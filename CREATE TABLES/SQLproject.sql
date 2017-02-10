USE InformationCompany
GO

/*-------------------------------------CREATE PREFECTURE AND MUNICIPALITY TABLE---------------------------------------------*/
CREATE TABLE Prefecture
(
pref_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
pref_name NVARCHAR(20) NOT NULL
)

CREATE TABLE Municipality
(
mun_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
mun_name NVARCHAR(20) NOT NULL,
mun_pref INT NOT NULL FOREIGN KEY REFERENCES Prefecture(pref_id)
)

/*-------------------------------------CREATE EMPLOYEE TABLE---------------------------------------------*/

CREATE TABLE Speciality
(
spec_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
spec_name NVARCHAR(20) NOT NULL
)

CREATE TABLE Employee 
(
emp_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
emp_fname NVARCHAR(20) NOT NULL,
emp_sname NVARCHAR(20) NOT NULL,
emp_email NVARCHAR(20) NOT NULL,
emp_afm NVARCHAR(20) NOT NULL,
emp_amka NVARCHAR(20) NOT NULL,
emp_isContractor BIT NOT NULL,
emp_salary DECIMAL(11,2),
emp_datetime DATETIME NOT NULL,
emp_zip INT NOT NULL,
emp_spec INT NOT NULL FOREIGN KEY REFERENCES Speciality(spec_id), 
emp_mun INT NOT NULL FOREIGN KEY REFERENCES Municipality(mun_id), 
)

CREATE TABLE Phone_Employee
(
PhoEmp_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
PhoEmp_number  NVARCHAR(20) NOT NULL,
PhoEmp_emp INT NOT NULL FOREIGN KEY REFERENCES Employee(emp_id)
)

/*-------------------------------------CREATE CLIENT TABLE---------------------------------------------*/

CREATE TABLE Client
(
cl_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
cl_fname NVARCHAR(20) NOT NULL,
cl_sname NVARCHAR(20) NOT NULL,
cl_name NVARCHAR(20) NOT NULL,
cl_email NVARCHAR(20) NOT NULL,
cl_zip NVARCHAR(20) NOT NULL,
cl_afm NVARCHAR(20) NOT NULL,
cl_mun INT NOT NULL FOREIGN KEY REFERENCES Municipality(mun_id),
)

CREATE TABLE Phone_Client
(
PhoCl_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
PhoCl_number  NVARCHAR(20) NOT NULL,
PhoCl_cl INT NOT NULL FOREIGN KEY REFERENCES Client(cl_id)
)

/*-------------------------------------CREATE PROJECT TABLE---------------------------------------------*/

CREATE TABLE Category
(
cat_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
cat_name NVARCHAR(20) NOT NULL
)

CREATE TABLE Tag
(
tag_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
tag_name NVARCHAR(20) NOT NULL
)

CREATE TABLE Project
(
pro_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
pro_name NVARCHAR(20) NOT NULL,
pro_detail NVARCHAR(MAX) NOT NULL,
pro_cost DECIMAL(11,2) NOT NULL, 
pro_price DECIMAL(11,2) NOT NULL, 
pro_client INT NOT NULL FOREIGN KEY REFERENCES Client(cl_id)
)

CREATE TABLE Phase
(
phase_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
phase_description NVARCHAR(60) NOT NULL
) 

CREATE TABLE Project_Phase
(
ProPhase_phase_id INT NOT NULL FOREIGN KEY REFERENCES Phase(phase_id),
ProPhase_pro_id  INT NOT NULL FOREIGN KEY REFERENCES Project(pro_id),
ProPhase_datetime DATETIME NOT NULL
)

CREATE TABLE Cancel
(
cancel_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
cancel_datetime DATETIME NOT NULL,
cancel_project INT NOT NULL FOREIGN KEY REFERENCES Project(pro_id)
)

CREATE TABLE Category_Project
(
CatPro_pro_id INT NOT NULL FOREIGN KEY REFERENCES Project(pro_id),
CatPro_cat_id  INT NOT NULL FOREIGN KEY REFERENCES Category(cat_id)
)

CREATE TABLE Tag_Project
(
TagPro_pro_id INT NOT NULL FOREIGN KEY REFERENCES Project(pro_id),
TagPro_tag_id  INT NOT NULL FOREIGN KEY REFERENCES Tag(tag_id)
)

CREATE TABLE Employee_Project
(
EmpPro_emp_id INT NOT NULL FOREIGN KEY REFERENCES Employee(emp_id),
EmpPro__pro_id INT NOT NULL FOREIGN KEY REFERENCES Project(pro_id)
)
