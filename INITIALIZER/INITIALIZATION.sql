USE InformationCompany
GO

/*-------------------------------------INITIALIZE MUNICIPALITIES ---------------------------------------------*/
INSERT_MUNICIPALITIES 'ΑΘΗΝΩΝ','ΑΤΤΙΚΗΣ'
GO
INSERT_MUNICIPALITIES 'ΠΕΡΙΣΤΕΡΙΟΥ','ΑΤΤΙΚΗΣ' 
GO
INSERT_MUNICIPALITIES 'ΖΩΓΡΑΦΟΥ','ΑΤΤΙΚΗΣ'
GO
INSERT_MUNICIPALITIES 'ΒΥΡΩΝΑ','ΑΤΤΙΚΗΣ' 
GO
INSERT_MUNICIPALITIES 'ΓΛΥΦΑΔΑ','ΑΤΤΙΚΗΣ' 
GO
INSERT_MUNICIPALITIES 'ΘΕΣΣΑΛΟΝΙΚΗ','ΘΕΣΑΛΟΝΙΚΗΣ' 
GO
INSERT_MUNICIPALITIES 'ΧΑΛΚΙΔΑ','ΕΥΒΟΙΑΣ' 
GO
INSERT_MUNICIPALITIES 'ΗΡΑΚΛΕΙΟ','ΗΡΑΚΛΕΙΟΥ' 
GO
INSERT_MUNICIPALITIES 'ΡΟΔΟΣ','ΔΩΔΕΚΑΝΗΣΟΥ' 
GO
INSERT_MUNICIPALITIES 'ΠΑΤΡΑ','ΑΧΑΪΑΣ' 
GO

/*-------------------------------------INITIALIZE EMPLOYEES ---------------------------------------------*/

INSERT_EMPLOYEE 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','gianevag@hotmail.com','694955948','00001','0000001',1,1200, '18-01-16' ,11632,'WEB DEVELOPER','ΡΟΔΟΣ'
GO
INSERT_EMPLOYEE 'ΑΛΕΞΙΟΥ','ΠΕΤΡΟΣ','palexiou@gmail.com','693455678','00002','0000022',1,1500, '28-10-12' ,11212,'FRONT END DEVELOPER','ΑΘΗΝΩΝ'
GO
INSERT_EMPLOYEE 'ΛΥΚΟΥΡΕΣΗΣ','ΔΗΜΗΤΡΙΟΣ','dlukouresis@yahoo.com','697357628','00003','0000033',1,1100, '2-10-15' ,12692,'BACK END DEVELOPER','ΠΕΡΙΣΤΕΡΙΟΥ'
GO
INSERT_EMPLOYEE 'ΣΤΑΥΡΑΚΑΚΗΣ','ΣΤΑΥΡΟΣ','sstaurakakis@hotmail.com','694335568','00004','0000433',1,1600, '1-12-12' ,17421,'DATABASE ADMINISTRATOR','ΒΥΡΩΝΑ'
GO
INSERT_EMPLOYEE 'ΚΙΛΙΜΑΝΤΖΟΣ','ΑΝΔΡΕΑΣ','akilinimatzos@gmail.com','694677868','00005','0003753',1,1400, '2-6-13' ,13319,'DESIGNER','ΑΘΗΝΩΝ'
GO
INSERT_EMPLOYEE 'ΤΣΑΦΤΑΡΙΔΗΣ','ΑΘΗΝΑ','atsaftaridi@hotmail.com','6935634987','00006','0018423',1,1300, '2-6-15' ,13319,'DESIGNER','ΑΘΗΝΩΝ'
GO
INSERT_EMPLOYEE 'ΠΑΠΑΚΩΣΤΟΠΟΥΛΟΣ','ΠΕΤΡΟΣ','ppapakwstopoulos@gmail.com','6945233907','00012','0418453',0,NULL, '1-11-16' ,14517,'PHP DEVELOPER','ΘΕΣΣΑΛΟΝΙΚΗ'
GO
INSERT_EMPLOYEE 'ΔΗΜΗΤΡΙΟΥ','ΔΗΜΗΤΡΙΟΣ','ddhmhtrioy@yahoo.com','6937892592','00112','1356788',0,NULL,'5-12-16' ,14517,'WEB DEVELOPER','ΑΘΗΝΩΝ'
GO
INSERT_EMPLOYEE 'ΧΡΙΣΤΟΠΟΥΛΟΣ','ΠΑΝΑΓΙΩΤΗΣ','pxristopoulos@yahoo.com','6953561132','345512','12525687',1,1800,'5-12-04' ,11527,'C# DEVELOPER','ΑΘΗΝΩΝ'
GO
INSERT_EMPLOYEE 'ΠΑΠΑΚΩΝΣΤΑΝΤΙΝΟΥ','ΝΙΚΟΛΑΟΣ','npapakost@gmail.com','6942291561','11232','41672311',0,NULL,'13-3-13' ,12214,'DATABASE ADMINISTRATOR','ΡΟΔΟΣ'
GO
INSERT_EMPLOYEE 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','aderbetzis@gmail.com','6956671261','12249','13456712',0,NULL,'01-9-12',12454,'JAVA DEVEROPER','ΠΕΡΙΣΤΕΡΙΟΥ'
GO

/*-------------------------------------INITIALIZE CLIENTS ---------------------------------------------*/

INSERT_CLIENT 'ΒΑΣΙΛΟΠΟΥΛΟΣ','ΓΕΩΡΓΙΟΣ','ΒΑΣΙΛΟΠΟΥΛΟΣ ΑΕ','basilopoulos@hotmail.com', '694329393', '11111', 11634,'ΠΕΡΙΣΤΕΡΙΟΥ'
GO
INSERT_CLIENT 'ΑΡΓΥΡΙΟΥ','ΠΑΝΑΓΙΩΤΗΣ','IBM','ibm@gmail.com', '2103455432', '12222', 11764,'ΑΘΗΝΩΝ'
GO
INSERT_CLIENT 'ΧΡΗΣΤΟΥ','ΔΗΜΗΤΡΙΟΣ','GOOGLE','google@gmail.com', '2113778432', '15368', 12314,'ΓΛΥΦΑΔΑ'
GO
INSERT_CLIENT 'ΠΑΠΑΝΙΚΟΛΑΟΥ','ΑΡΓΥΡΙΟΣ','BLUESTARS','BLUESTARS@hotmail.com', '2104667483', '17722', 12278,'ΡΟΔΟΣ'
GO
INSERT_CLIENT 'ΖΑΡΥΦΟΠΟΥΛΟΥ','ΙΩΑΝΝΑ','COSMOTE','COSMOS@gmail.com', '2112165783', '11051', 11163,'ΧΑΛΚΙΔΑ'
GO
INSERT_CLIENT 'ΦΑΡΑΝΤΑΤΟΣ','ΗΛΙΑΣ','ΟΠΑΠ','opap@hotmail.com', '2103213567', '12211', 12453,'ΑΘΗΝΩΝ'
GO
INSERT_CLIENT 'ΚΑΡΑΘΑΝΟΥ','ΠΑΝΑΓΙΩΤΑ','STAR','strar@gmail.com', '2114551645', '11662', 11633,'ΑΘΗΝΩΝ'
GO
INSERT_CLIENT 'ΣΤΑΜΟΣ','ΘΑΝΑΣΙΟΣ','BLUELINES','blueline@yahoo.com', '2102660221', '13412', 11123,'ΒΥΡΩΝΑ'
GO
/*-------------------------------------INITIALIZE PHASES ---------------------------------------------*/

INSERT_PHASE 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ'
GO
INSERT_PHASE 'ΑΝΑΘΕΣΗ'
GO
INSERT_PHASE 'ΕΞΕΛΙΞΗ'
GO
INSERT_PHASE 'ΠΑΡΑΔΟΣΗ'
GO
INSERT_PHASE 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟΣΗ'
GO
INSERT_PHASE 'ΑΚΥΡΩΣΗ'
GO

/*-------------------------------------INITIALIZE CATEGORIES ---------------------------------------------*/

INSERT_CATEGORY 'WEB SITE'
GO
INSERT_CATEGORY 'ANDROID APP'
GO
INSERT_CATEGORY 'WINDOWS APP' 
GO
INSERT_CATEGORY 'IOS APP'
GO
INSERT_CATEGORY 'DATABASE MODELING'
GO

/*-------------------------------------INITIALIZE TAGS ---------------------------------------------*/

INSERT_TAG 'C#'
GO
INSERT_TAG '.NET MVC'
GO
INSERT_TAG 'C++'
GO
INSERT_TAG 'MS SQL'
GO
INSERT_TAG 'JAVA'
GO
INSERT_TAG 'PHP'
GO
INSERT_TAG 'HTML'
GO
INSERT_TAG 'WEB'
GO

/*-------------------------------------INITIALIZE PROJECTS ---------------------------------------------*/

INSERT_PROJECT 'PROJECT1','DETAILS OF PROJECT',3000,5000,'WEB SITE','HTML','IBM'
GO
ADD_TAG_PROJECT 'PROJECT1','.NET MVC'
GO
ADD_TAG_PROJECT 'PROJECT1','WEB'
GO


INSERT_PROJECT 'PROJECT2','DETAILS OF PROJECT2',2000,3000,'ANDROID APP','JAVA','GOOGLE'
GO
ADD_CATEGORY_PROJECT 'PROJECT2','WEB SITE'
GO
ADD_TAG_PROJECT 'PROJECT2','.NET MVC'
GO


INSERT_PROJECT 'PROJECT3','DETAILS OF PROJECT3',6000,8000,'WINDOWS APP','.NET MVC','BLUESTARS'
GO


INSERT_PROJECT 'PROJECT4','DETAILS OF PROJECT4',5000,8000,'ANDROID APP','PHP','ΒΑΣΙΛΟΠΟΥΛΟΣ ΑΕ'
GO
ADD_TAG_PROJECT 'PROJECT4','.NET MVC'
GO


INSERT_PROJECT 'PROJECT5','DETAILS OF PROJECT5',2000,4000,'IOS APP','C++','COSMOTE'
GO
ADD_TAG_PROJECT 'PROJECT5','.NET MVC'
GO


INSERT_PROJECT 'PROJECT6','DETAILS OF PROJECT6',3000,6000,'WEB SITE','HTML','ΟΠΑΠ'
GO
ADD_TAG_PROJECT 'PROJECT6','.NET MVC'
GO


INSERT_PROJECT 'PROJECT7','DETAILS OF PROJECT7',10000,15000,'DATABASE MODELING','MS SQL','BLUELINES'
GO
ADD_TAG_PROJECT 'PROJECT7','.NET MVC'
GO


INSERT_PROJECT 'PROJECT8','DETAILS OF PROJECT8',7000,9000,'WINDOWS APP','.NET MVC','ΒΑΣΙΛΟΠΟΥΛΟΣ ΑΕ'
GO


INSERT_PROJECT 'STARPROJECT1','DETAILS OF STAR PROJECT1',3000,5000,'WINDOWS APP','.NET MVC','STAR'
GO

INSERT_PROJECT 'STARPROJECT2','DETAILS OF STAR PROJECT2',2000,3000,'ANDROID APP','JAVA','STAR'
GO
ADD_TAG_PROJECT 'STARPROJECT2','.NET MVC'
GO
/*-------------------------------------INITIALIZE PROJECTS_EMPLOYEES ---------------------------------------------*/

ADD_EMPLOYEE_PROJECT 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','PROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','PROJECT2'
GO
ADD_EMPLOYEE_PROJECT 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','PROJECT7'
GO
ADD_EMPLOYEE_PROJECT 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΕΥΑΓΓΕΛΙΔΗΣ','ΝΕΚΤΑΡΙΟΣ','PROJECT5'
GO
ADD_EMPLOYEE_PROJECT 'ΑΛΕΞΙΟΥ','ΠΕΤΡΟΣ','PROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΑΛΕΞΙΟΥ','ΠΕΤΡΟΣ','STARPROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΑΛΕΞΙΟΥ','ΠΕΤΡΟΣ','PROJECT5'
GO
ADD_EMPLOYEE_PROJECT 'ΑΛΕΞΙΟΥ','ΠΕΤΡΟΣ','PROJECT2'
GO
ADD_EMPLOYEE_PROJECT 'ΛΥΚΟΥΡΕΣΗΣ','ΔΗΜΗΤΡΙΟΣ','PROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΛΥΚΟΥΡΕΣΗΣ','ΔΗΜΗΤΡΙΟΣ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΛΥΚΟΥΡΕΣΗΣ','ΔΗΜΗΤΡΙΟΣ','PROJECT4'
GO
ADD_EMPLOYEE_PROJECT 'ΛΥΚΟΥΡΕΣΗΣ','ΔΗΜΗΤΡΙΟΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΣΤΑΥΡΑΚΑΚΗΣ','ΣΤΑΥΡΟΣ','PROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΣΤΑΥΡΑΚΑΚΗΣ','ΣΤΑΥΡΟΣ','STARPROJECT2'
GO
ADD_EMPLOYEE_PROJECT 'ΣΤΑΥΡΑΚΑΚΗΣ','ΣΤΑΥΡΟΣ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΚΙΛΙΜΑΝΤΖΟΣ','ΑΝΔΡΕΑΣ','PROJECT2'
GO
ADD_EMPLOYEE_PROJECT 'ΚΙΛΙΜΑΝΤΖΟΣ','ΑΝΔΡΕΑΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΚΙΛΙΜΑΝΤΖΟΣ','ΑΝΔΡΕΑΣ','PROJECT5'
GO
ADD_EMPLOYEE_PROJECT 'ΤΣΑΦΤΑΡΙΔΗΣ','ΑΘΗΝΑ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΤΣΑΦΤΑΡΙΔΗΣ','ΑΘΗΝΑ','STARPROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΤΣΑΦΤΑΡΙΔΗΣ','ΑΘΗΝΑ','PROJECT4'
GO
ADD_EMPLOYEE_PROJECT 'ΔΗΜΗΤΡΙΟΥ','ΔΗΜΗΤΡΙΟΣ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΔΗΜΗΤΡΙΟΥ','ΔΗΜΗΤΡΙΟΣ','PROJECT7'
GO
ADD_EMPLOYEE_PROJECT 'ΔΗΜΗΤΡΙΟΥ','ΔΗΜΗΤΡΙΟΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΣΤΟΠΟΥΛΟΣ','ΠΕΤΡΟΣ','PROJECT6'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΣΤΟΠΟΥΛΟΣ','ΠΕΤΡΟΣ','STARPROJECT1'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΣΤΟΠΟΥΛΟΣ','ΠΕΤΡΟΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΝΣΤΑΝΤΙΝΟΥ','ΝΙΚΟΛΑΟΣ','PROJECT6'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΝΣΤΑΝΤΙΝΟΥ','ΝΙΚΟΛΑΟΣ','PROJECT7'
GO
ADD_EMPLOYEE_PROJECT 'ΠΑΠΑΚΩΝΣΤΑΝΤΙΝΟΥ','ΝΙΚΟΛΑΟΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','PROJECT6'
GO
ADD_EMPLOYEE_PROJECT 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','PROJECT7'
GO
ADD_EMPLOYEE_PROJECT 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','PROJECT8'
GO
ADD_EMPLOYEE_PROJECT 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','PROJECT3'
GO
ADD_EMPLOYEE_PROJECT 'ΔΕΡΒΕΤΖΗΣ','ΑΝΔΡΕΑΣ','PROJECT1'
GO
/*-------------------------------------INITIALIZE PROJECTS_PHASES ---------------------------------------------*/


ADD_PHASE_PROJECT 'PROJECT1', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '30-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT1', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '12-1-16'
GO
ADD_PHASE_PROJECT 'PROJECT1', 'ΑΝΑΘΕΣΗ', '12-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT1', 'ΕΞΕΛΙΞΗ', '12-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT1', 'ΠΑΡΑΔΟΣΗ', '25-5-16'
GO


ADD_PHASE_PROJECT 'PROJECT2', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '30-5-17'
GO
ADD_PHASE_PROJECT 'PROJECT2', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '12-11-16'
GO
ADD_PHASE_PROJECT 'PROJECT2', 'ΑΝΑΘΕΣΗ', '20-11-16'
GO
ADD_PHASE_PROJECT 'PROJECT2', 'ΕΞΕΛΙΞΗ', '22-11-16'
GO


ADD_PHASE_PROJECT 'PROJECT3', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '30-3-17'
GO
ADD_PHASE_PROJECT 'PROJECT3', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '2-10-16'
GO
ADD_PHASE_PROJECT 'PROJECT3', 'ΑΝΑΘΕΣΗ', '10-10-16'
GO
ADD_PHASE_PROJECT 'PROJECT3', 'ΕΞΕΛΙΞΗ', '15-10-16'
GO

ADD_PHASE_PROJECT 'PROJECT4', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '30-9-16'
GO
ADD_PHASE_PROJECT 'PROJECT4', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '20-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT4', 'ΑΝΑΘΕΣΗ', '25-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT4', 'ΕΞΕΛΙΞΗ', '28-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT4', 'ΠΑΡΑΔΟΣΗ', '25-9-16'
GO

ADD_PHASE_PROJECT 'PROJECT5', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '25-10-16'
GO
ADD_PHASE_PROJECT 'PROJECT5', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '15-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT5', 'ΑΝΑΘΕΣΗ', '25-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT5', 'ΕΞΕΛΙΞΗ', '26-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT5', 'ΠΑΡΑΔΟΣΗ', '24-10-16'
GO

ADD_PHASE_PROJECT 'PROJECT6', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '11-06-15'
GO
ADD_PHASE_PROJECT 'PROJECT6', 'ΑΚΥΡΩΣΗ', '20-06-15'
GO

ADD_PHASE_PROJECT 'PROJECT7', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '11-10-16'
GO
ADD_PHASE_PROJECT 'PROJECT7', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '20-6-16'
GO
ADD_PHASE_PROJECT 'PROJECT7', 'ΑΝΑΘΕΣΗ', '25-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT7', 'ΕΞΕΛΙΞΗ', '26-5-16'
GO
ADD_PHASE_PROJECT 'PROJECT7', 'ΠΑΡΑΔΟΣΗ', '10-10-16'
GO

ADD_PHASE_PROJECT 'PROJECT8', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '30-10-16'
GO
ADD_PHASE_PROJECT 'PROJECT8', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '12-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT8', 'ΑΝΑΘΕΣΗ', '19-2-16'
GO
ADD_PHASE_PROJECT 'PROJECT8', 'ΕΞΕΛΙΞΗ', '1-4-16'
GO
ADD_PHASE_PROJECT 'PROJECT8', 'ΠΑΡΑΔΟΣΗ', '20-10-16'
GO

ADD_PHASE_PROJECT 'STARPROJECT1', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '11-10-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT1', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '15-5-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT1', 'ΑΝΑΘΕΣΗ', '25-5-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT1', 'ΕΞΕΛΙΞΗ', '26-5-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT1', 'ΠΑΡΑΔΟΣΗ', '2-11-16'
GO

ADD_PHASE_PROJECT 'STARPROJECT2', 'ΕΚΤΙΜΩΜΕΝΗ ΗΜ.ΠΑΡΑΔΟ', '1-11-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT2', 'ΔΙΑΠΡΑΓΜΑΤΕΥΣΗ', '15-6-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT2', 'ΑΝΑΘΕΣΗ', '25-6-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT2', 'ΕΞΕΛΙΞΗ', '27-6-16'
GO
ADD_PHASE_PROJECT 'STARPROJECT2', 'ΠΑΡΑΔΟΣΗ', '2-10-16'
GO

select emp_sname,pro_name,pro_cost,ProPhase_datetime,cat_name
from Project join  Employee_Project on pro_id=EmpPro__pro_id join Employee on emp_id=EmpPro_emp_id
join Project_Phase on pro_id=ProPhase_pro_id join Category_Project on CatPro_pro_id=pro_id join Category on cat_id=CatPro_cat_id
where  ProPhase_phase_id=4 and ProPhase_datetime BETWEEN '20161001' AND '20161030' and emp_isContractor=0
group by emp_sname,pro_name,pro_cost,ProPhase_datetime,cat_name