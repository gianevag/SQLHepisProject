USE [master]
GO
/****** Object:  Database [InformationCompany]    Script Date: 1/1/2017 3:04:07 AM ******/
CREATE DATABASE [InformationCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InformationCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InformationCompany.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InformationCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InformationCompany_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InformationCompany] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InformationCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InformationCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InformationCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InformationCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InformationCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InformationCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [InformationCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InformationCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InformationCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InformationCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InformationCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InformationCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InformationCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InformationCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InformationCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InformationCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InformationCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InformationCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InformationCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InformationCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InformationCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InformationCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InformationCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InformationCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InformationCompany] SET  MULTI_USER 
GO
ALTER DATABASE [InformationCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InformationCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InformationCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InformationCompany] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InformationCompany] SET DELAYED_DURABILITY = DISABLED 
GO
USE [InformationCompany]
GO
/****** Object:  Table [dbo].[Cancel]    Script Date: 1/1/2017 3:04:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancel](
	[cancel_id] [int] IDENTITY(1,1) NOT NULL,
	[cancel_datetime] [datetime] NOT NULL,
	[cancel_project] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cancel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category_Project]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Project](
	[CatPro_pro_id] [int] NOT NULL,
	[CatPro_cat_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[cl_id] [int] IDENTITY(1,1) NOT NULL,
	[cl_fname] [nvarchar](20) NOT NULL,
	[cl_sname] [nvarchar](20) NOT NULL,
	[cl_name] [nvarchar](20) NOT NULL,
	[cl_email] [nvarchar](20) NOT NULL,
	[cl_zip] [nvarchar](20) NOT NULL,
	[cl_afm] [nvarchar](20) NOT NULL,
	[cl_mun] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_fname] [nvarchar](20) NOT NULL,
	[emp_sname] [nvarchar](20) NOT NULL,
	[emp_email] [nvarchar](20) NOT NULL,
	[emp_afm] [nvarchar](20) NOT NULL,
	[emp_amka] [nvarchar](20) NOT NULL,
	[emp_isContractor] [bit] NOT NULL,
	[emp_salary] [decimal](11, 2) NULL,
	[emp_datetime] [datetime] NOT NULL,
	[emp_zip] [int] NOT NULL,
	[emp_spec] [int] NOT NULL,
	[emp_mun] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Project]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Project](
	[EmpPro_emp_id] [int] NOT NULL,
	[EmpPro__pro_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Municipality]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipality](
	[mun_id] [int] IDENTITY(1,1) NOT NULL,
	[mun_name] [nvarchar](20) NOT NULL,
	[mun_pref] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phase]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phase](
	[phase_id] [int] IDENTITY(1,1) NOT NULL,
	[phase_description] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[phase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone_Client]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone_Client](
	[PhoCl_id] [int] IDENTITY(1,1) NOT NULL,
	[PhoCl_number] [nvarchar](20) NOT NULL,
	[PhoCl_cl] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoCl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone_Employee]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone_Employee](
	[PhoEmp_id] [int] IDENTITY(1,1) NOT NULL,
	[PhoEmp_number] [nvarchar](20) NOT NULL,
	[PhoEmp_emp] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoEmp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prefecture]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prefecture](
	[pref_id] [int] IDENTITY(1,1) NOT NULL,
	[pref_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](20) NOT NULL,
	[pro_detail] [nvarchar](max) NOT NULL,
	[pro_cost] [decimal](11, 2) NOT NULL,
	[pro_price] [decimal](11, 2) NOT NULL,
	[pro_client] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_Phase]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Phase](
	[ProPhase_phase_id] [int] NOT NULL,
	[ProPhase_pro_id] [int] NOT NULL,
	[ProPhase_datetime] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[spec_id] [int] IDENTITY(1,1) NOT NULL,
	[spec_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[spec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag_Project]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_Project](
	[TagPro_pro_id] [int] NOT NULL,
	[TagPro_tag_id] [int] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cancel]  WITH CHECK ADD FOREIGN KEY([cancel_project])
REFERENCES [dbo].[Project] ([pro_id])
GO
ALTER TABLE [dbo].[Category_Project]  WITH CHECK ADD FOREIGN KEY([CatPro_pro_id])
REFERENCES [dbo].[Project] ([pro_id])
GO
ALTER TABLE [dbo].[Category_Project]  WITH CHECK ADD FOREIGN KEY([CatPro_cat_id])
REFERENCES [dbo].[Category] ([cat_id])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([cl_mun])
REFERENCES [dbo].[Municipality] ([mun_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([emp_mun])
REFERENCES [dbo].[Municipality] ([mun_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([emp_spec])
REFERENCES [dbo].[Speciality] ([spec_id])
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD FOREIGN KEY([EmpPro_emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Employee_Project]  WITH CHECK ADD FOREIGN KEY([EmpPro__pro_id])
REFERENCES [dbo].[Project] ([pro_id])
GO
ALTER TABLE [dbo].[Municipality]  WITH CHECK ADD FOREIGN KEY([mun_pref])
REFERENCES [dbo].[Prefecture] ([pref_id])
GO
ALTER TABLE [dbo].[Phone_Client]  WITH CHECK ADD FOREIGN KEY([PhoCl_cl])
REFERENCES [dbo].[Client] ([cl_id])
GO
ALTER TABLE [dbo].[Phone_Employee]  WITH CHECK ADD FOREIGN KEY([PhoEmp_emp])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD FOREIGN KEY([pro_client])
REFERENCES [dbo].[Client] ([cl_id])
GO
ALTER TABLE [dbo].[Project_Phase]  WITH CHECK ADD FOREIGN KEY([ProPhase_phase_id])
REFERENCES [dbo].[Phase] ([phase_id])
GO
ALTER TABLE [dbo].[Project_Phase]  WITH CHECK ADD FOREIGN KEY([ProPhase_pro_id])
REFERENCES [dbo].[Project] ([pro_id])
GO
ALTER TABLE [dbo].[Tag_Project]  WITH CHECK ADD FOREIGN KEY([TagPro_pro_id])
REFERENCES [dbo].[Project] ([pro_id])
GO
ALTER TABLE [dbo].[Tag_Project]  WITH CHECK ADD FOREIGN KEY([TagPro_tag_id])
REFERENCES [dbo].[Tag] ([tag_id])
GO
/****** Object:  StoredProcedure [dbo].[ADD_CATEGORY_PROJECT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ADD_CATEGORY_PROJECT](@name VARCHAR(20), @category VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Category_Project ON CatPro_pro_id=pro_id) join Category ON cat_id = CatPro_cat_id WHERE pro_name=@name AND cat_name = @category )
	
	INSERT INTO Category_Project(CatPro_pro_id, CatPro_cat_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@name),(SELECT cat_id FROM Category WHERE cat_name=@category))


GO
/****** Object:  StoredProcedure [dbo].[ADD_EMPLOYEE_PROJECT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_EMPLOYEE_PROJECT](@sname VARCHAR(20), @fname VARCHAR(20), @project VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Employee_Project ON EmpPro__pro_id=pro_id) join Employee ON emp_id = EmpPro_emp_id WHERE emp_fname = @fname AND emp_sname = @sname AND pro_name = @project )
	
	INSERT INTO Employee_Project(EmpPro__pro_id, EmpPro_emp_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@project),(SELECT emp_id FROM Employee WHERE emp_fname = @fname AND emp_sname = @sname))


GO
/****** Object:  StoredProcedure [dbo].[ADD_PHASE_PROJECT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_PHASE_PROJECT](@project VARCHAR(20), @phase VARCHAR(60), @datetime VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Project_Phase ON ProPhase_pro_id=pro_id) join Phase ON phase_id = ProPhase_phase_id WHERE phase_description = @phase AND pro_name = @project)
	
	INSERT INTO Project_Phase(ProPhase_phase_id, ProPhase_pro_id, ProPhase_datetime)
	VALUES((SELECT phase_id FROM Phase WHERE phase_description = @phase), (SELECT pro_id FROM Project WHERE pro_name=@project), CONVERT(date,@datetime,5))


GO
/****** Object:  StoredProcedure [dbo].[ADD_TAG_PROJECT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ADD_TAG_PROJECT](@name VARCHAR(20), @tag VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM (Project join Tag_Project ON TagPro_pro_id=pro_id) join Tag ON tag_id = TagPro_tag_id WHERE pro_name=@name AND tag_name = @tag )
	
	INSERT INTO Tag_Project(TagPro_pro_id, TagPro_tag_id)
	VALUES((SELECT pro_id FROM Project WHERE pro_name=@name),(SELECT tag_id FROM Tag WHERE tag_name=@tag))


GO
/****** Object:  StoredProcedure [dbo].[ContractorMoney]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ContractorMoney] (@date nvarchar(20))
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
/****** Object:  StoredProcedure [dbo].[INSERT_CATEGORY]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_CATEGORY](@category VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Category WHERE cat_name=@category)

	INSERT INTO Category(cat_name)
	VALUES (@category);


GO
/****** Object:  StoredProcedure [dbo].[INSERT_CLIENT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_CLIENT](@sname VARCHAR(20), @fname VARCHAR(20), @name VARCHAR(20), @email VARCHAR(20), @phone VARCHAR(20), @zip INT, @afm INT, @municipality NVARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Client WHERE cl_afm=@afm)

	INSERT INTO Client(cl_sname,cl_fname,cl_name, cl_email, cl_afm, cl_zip, cl_mun)
	VALUES (@sname, @fname, @name, @email, @afm, @zip, 
	(SELECT mun_id FROM Municipality WHERE mun_name=@municipality));

EXEC INSERT_PHONENUMBER_CLIENT @name, @phone


GO
/****** Object:  StoredProcedure [dbo].[INSERT_EMPLOYEE]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_EMPLOYEE](@sname VARCHAR(20),@fname VARCHAR(20),@email VARCHAR(20),@phone VARCHAR(20),
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
/****** Object:  StoredProcedure [dbo].[INSERT_MUNICIPALITIES]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_MUNICIPALITIES](@municipality VARCHAR(20), @prefecture VARCHAR(20))
AS

EXEC INSERT_PREFECTURE @prefecture

IF (SELECT mun_name FROM Municipality WHERE mun_name LIKE + '%' + @municipality +'%') IS NULL	
	
	INSERT INTO Municipality(mun_name, mun_pref)
	VALUES (@municipality, (SELECT pref_id FROM Prefecture WHERE pref_name=@prefecture)) 

GO
/****** Object:  StoredProcedure [dbo].[INSERT_PHASE]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------CREATE PROJECT TABLE---------------------------------------------*/

CREATE PROCEDURE [dbo].[INSERT_PHASE] (@phase VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Phase WHERE phase_description=@phase)

	INSERT INTO Phase(phase_description)
	VALUES (@phase);


GO
/****** Object:  StoredProcedure [dbo].[INSERT_PHONENUMBER_CLIENT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------CREATE CLIENT TABLE---------------------------------------------*/

CREATE PROCEDURE [dbo].[INSERT_PHONENUMBER_CLIENT](@name VARCHAR(20),@phone VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Client JOIN Phone_Client ON PhoCl_cl=cl_id WHERE PhoCl_number = @phone) 
	
	INSERT INTO Phone_Client(PhoCl_number, PhoCl_cl)
	VALUES(@phone,(SELECT cl_id from Client WHERE cl_name=@name))
		

GO
/****** Object:  StoredProcedure [dbo].[INSERT_PHONENUMBER_EMP]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INSERT_PHONENUMBER_EMP](@fname VARCHAR(20),@sname VARCHAR(20),@phone VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Employee JOIN Phone_Employee ON PhoEmp_emp=emp_id WHERE PhoEmp_number = @phone) 
	
	INSERT INTO Phone_Employee(PhoEmp_number, PhoEmp_emp)
	VALUES(@phone,(SELECT emp_id from Employee WHERE emp_fname= @fname AND emp_sname=@sname));
		

GO
/****** Object:  StoredProcedure [dbo].[INSERT_PREFECTURE]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-------------------------------------CREATE MUNICIPALITIES AND PREFECTURE TABLE---------------------------------------------*/

CREATE PROCEDURE [dbo].[INSERT_PREFECTURE] (@prefecture VARCHAR(20))
AS

IF (SELECT pref_name FROM Prefecture WHERE pref_name LIKE +'%' + @prefecture +'%') IS NULL

	INSERT INTO Prefecture(pref_name)
	VALUES (@prefecture);


GO
/****** Object:  StoredProcedure [dbo].[INSERT_PROJECT]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_PROJECT](@name VARCHAR(20), @detail VARCHAR(500), @cost DECIMAL(11,2), @price DECIMAL(11,2),@category VARCHAR(20), @tag VARCHAR(20), @client NVARCHAR(20))
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
/****** Object:  StoredProcedure [dbo].[INSERT_SPECIALY]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-------------------------------------CREATE EMPLOYEE TABLE---------------------------------------------*/

CREATE PROCEDURE [dbo].[INSERT_SPECIALY] (@speciality VARCHAR(20))
AS

IF (SELECT spec_name FROM Speciality WHERE spec_name LIKE +'%' + @speciality +'%') IS NULL

	INSERT INTO Speciality(spec_name)
	VALUES (@speciality);


GO
/****** Object:  StoredProcedure [dbo].[INSERT_TAG]    Script Date: 1/1/2017 3:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_TAG](@tag VARCHAR(20))
AS

IF NOT EXISTS (SELECT * FROM Tag WHERE tag_name=@tag)

	INSERT INTO Tag(tag_name)
	VALUES (@tag);


GO
USE [master]
GO
ALTER DATABASE [InformationCompany] SET  READ_WRITE 
GO
