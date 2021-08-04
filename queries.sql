/* 
Professor 
Given the social security number of a professor, list the titles, classrooms,meeting days and time of his/her 
classes. 
Replace '4567' with given user input 
*/
SELECT Title, Classroom, MeetDays, B_Time, E_Time 
FROM PROFESSOR P, SECTION S, COURSE C 
WHERE P.SSN=S.P_SSN AND S.C_Num=C.C_Num AND P.SSN=4567;

/*
Given a course number and a section number, count how many students get each distinct grade, i.e.  ‘A’, ‘A-’, 
‘B+’, ‘B’, ‘B-’, etc. 
Replace '203' with given user input for C_Num and '01' with given user input for S_Num 
*/
SELECT E.Grade, Count(*) 
FROM COURSE C, SECTION S, ENROLLMENT E 
WHERE C.C_Num='203' AND S.S_Num='01' AND C.C_Num=S.C_Num AND S.S_Num=E.S_Num AND 
E.C_Num=C.C_Num 
GROUP BY E.Grade; 

/*
Students 
Given a course number list the sections of the course, including the class-rooms, the meeting days and time, and 
the number of students enrolled in each section. 
Replace '332' with given user input 
*/
SELECT  S.S_Num, S.Classroom, S.MeetDays,S.B_Time, S.E_Time, COUNT(*) 
FROM SECTION S, ENROLLMENT E 
WHERE S.C_Num='332' AND E.C_Num=S.C_Num AND S.S_Num=E.S_Num 
GROUP BY S.S_Num;

/*
Given the campus wide ID of a student, list all courses the student tookand the grades. 
Replace '5919' with given user input 
*/
SELECT C.Title, C.C_Num, E.Grade 
FROM STUDENT ST, COURSE C, ENROLLMENT E 
WHERE ST.CWID='5919' AND ST.CWID=E.ST_CWID AND E.C_Num=C.C_Num;