# Source code for creating tables.

CREATE TABLE PROFESSOR ( 
SSN INT NOT NULL, 
    St_Addr VARCHAR(30), 
    ZIP VARCHAR(5), 
    City VARCHAR(30), 
    State VARCHAR(2), 
    AreaCode VARCHAR(3), 
    Digits VARCHAR(7),  
    Sex VARCHAR(1), 
    Salary INT, 
    PName VARCHAR(100), 
    PRIMARY KEY (SSN) 
); 

CREATE TABLE DEPARTMENT ( 
    Name VARCHAR(100) NOT NULL, 
    D_Num INT NOT NULL,  
    Telephone VARCHAR(10), 
    OFFICE VARCHAR(40), 
    P_SSN INT, 
    PRIMARY KEY (D_Num), 
    FOREIGN KEY (P_SSN) REFERENCES PROFESSOR (SSN) 
); 

CREATE TABLE STUDENT ( 
    CWID INT NOT NULL, 
    Fname VARCHAR(40), 
    Lname VARCHAR(40), 
    Address VARCHAR(46), 
    Phone VARCHAR(10), 
    Dep_Num INT, 
    PRIMARY KEY (CWID), 
    FOREIGN KEY (Dep_Num) REFERENCES DEPARTMENT (D_Num) 
); 

CREATE TABLE COURSE ( 
    C_Num INT, 
    Units INT, 
    Title VARCHAR(100), 
    Textbook VARCHAR(100), 
    D_Num INT, 
    PRIMARY KEY (C_Num), 
    FOREIGN KEY (D_Num) REFERENCES DEPARTMENT (D_Num) 
); 

CREATE TABLE SECTION ( 
    S_Num INT NOT NULL, 
    B_Time VARCHAR(7), 
    E_Time VARCHAR(7), 
    Seats INT, 
    MeetDays VARCHAR(14), 
    Classroom VARCHAR(10), 
    C_Num INT, 
    P_SSN INT, 
    PRIMARY KEY (S_Num, C_Num), 
    FOREIGN KEY (P_SSN) REFERENCES PROFESSOR (SSN) 
);

CREATE TABLE MINOR ( 
    ST_CWID INT, 
    D_Num INT, 
    PRIMARY KEY (ST_CWID, D_Num), 
    FOREIGN KEY (ST_CWID) REFERENCES STUDENT (CWID), 
    FOREIGN KEY (D_Num) REFERENCES DEPARTMENT (D_Num) 
); 

CREATE TABLE ENROLLMENT ( 
    Grade VARCHAR(2), 
    ST_CWID INT, 
    S_Num INT, 
    C_Num INT, 
    PRIMARY KEY (ST_CWID, S_Num, C_Num), 
    FOREIGN KEY (ST_CWID) REFERENCES STUDENT (CWID), 
    FOREIGN KEY (S_Num) REFERENCES SECTION (S_Num), 
    FOREIGN KEY (C_Num) REFERENCES COURSE (C_Num) 
); 
CREATE TABLE prereqs ( 
    Prerequisite VARCHAR(30), 
    C_Num INT, 
    PRIMARY KEY (Prerequisite, C_Num), 
    FOREIGN KEY (C_Num) REFERENCES COURSE (C_Num) 
); 
CREATE TABLE college_degrees ( 
    Degree VARCHAR(100), 
    P_SSN INT, 
    PRIMARY KEY (Degree, P_SSN), 
    FOREIGN KEY (P_SSN) REFERENCES PROFESSOR (SSN) 
);

CREATE TABLE prof_titles ( 
    P_Title VARCHAR(40), 
    P_SSN INT, 
    PRIMARY KEY (P_Title, P_SSN), 
    FOREIGN KEY (P_SSN) REFERENCES PROFESSOR (SSN) 
);

# Add Professor data
INSERT INTO PROFESSOR 
VALUES(4567, '439 Devonshire Drive', 90723, 'Paramount', 'CA', 562, 1234567, 'M', 100100, 'George Luna'); 
INSERT INTO PROFESSOR 
VALUES(3366, '551 High Ave.', 92646, 'Huntington Beach', 'CA', 714, 6543210, 'F', 420420, 'Aleyna Mcnamara'); 
INSERT INTO PROFESSOR 
VALUES(3697, '9 Golden Star St.', 93436, 'Lompoc', 'CA', 805, 0147852, 'F', 85642, 'Jessica Weir'); 
INSERT INTO PROFESSOR 
VALUES(6543, '7786 Euclid St.', 92201, 'Indio', 'CA', 760, 8520147, 'M',  77777, 'Joao Snow'); 

# Add Department data
INSERT INTO DEPARTMENT 
VALUES('Computer Science', 852, '6572785987', 'CS-522', 4567); 
INSERT INTO DEPARTMENT 
VALUES('Electrical Engineering', 123, '6572783013', 'E-100a', 3366); 

# Add Student data
INSERT INTO STUDENT 
VALUES(6849, 'Sean', 'Hatfield', '34 Copperstone Lane Mission Viejo, CA 92692', '9493404419', 852); 
INSERT INTO STUDENT 
VALUES(5919, 'Vincent', 'Diep', '11382 Biscayne Blvd Garden Grove, CA 92841', '7149878606', 852); 
INSERT INTO STUDENT 
VALUES(1234, 'Emre', 'Elliott', '80 Roberts St. Hayward, CA 94544', '5102004704', 852); 
INSERT INTO STUDENT 
VALUES(1111, 'Gus', 'Stanton', '7581 Dogwood St. El Cajon, CA 92021', '6192011977', 852); 
INSERT INTO STUDENT 
VALUES(9876, 'Shakira', 'Deleon', '17 Plumb Branch Street Bakersfield, CA 93309', '6612014015', 123); 
INSERT INTO STUDENT 
VALUES(6969, 'Eiliyah', 'Andrews', '90 Railroad St. San Jose, CA 95112', '4082077333', 123); 
INSERT INTO STUDENT 
VALUES(3579, 'Garin', 'Byrne', '119 Howard Street Porterville, CA 93257', '5593060037', 123); 
INSERT INTO STUDENT 
VALUES(2468, 'Haaris', 'Peacock', '3 6th St. Oxnard, CA 93033', '8062162464', 123); 

# Add Course data
INSERT INTO COURSE 
VALUES(332, 3, 'File Structures and Database Systems', 'Fund.of Database Systems by ELMASRI', 852);
INSERT INTO COURSE
VALUES(240, 3, 'Computer Organization and Assembly Language', 'Assembly Language for X86 Processors by 
IRVINE', 852); 
INSERT INTO COURSE 
VALUES(245, 3, 'Computer Logic and Architecture', 'Digital Design by Mano', 123); 
INSERT INTO COURSE 
VALUES(203, 3, 'Electric Circuits', 'Fundamentals of Electric Circuits by Alexander', 123); 

# Add Section data
INSERT INTO SECTION 
VALUES(01, '4:00PM', '5:15PM', 35, 'TuTh', 'ZOOM111', 332, 4567); 
INSERT INTO SECTION 
VALUES(02, '4:00PM', '5:15PM', 30, 'MoWe', 'ZOOM213', 332, 3697); 
INSERT INTO SECTION 
VALUES(01, '11:30AM', '2:00PM', 40, 'TuTh', 'ZOOM111', 240, 4567); 
INSERT INTO SECTION 
VALUES(01, '8:00AM', '9:45AM', 33, 'Sa', 'ZOOM333', 203, 6543); 
INSERT INTO SECTION 
VALUES(01, '3:00PM', '4:15PM', 28, 'TuTh', 'ZOOM444', 245, 3366); 
INSERT INTO SECTION 
VALUES(02, '3:00PM', '4:15PM', 30, 'MoWe', 'ZOOM444', 245, 3366); 

# Add Minor data
INSERT INTO MINOR 
VALUES(3579, 852); 
INSERT INTO MINOR 
VALUES(6969, 852); 
INSERT INTO MINOR 
VALUES(2468, 852); 
INSERT INTO MINOR 
VALUES(9876, 852); 

# Add Enrollment data
INSERT INTO ENROLLMENT 
VALUES('A+',6849,2,332); 
INSERT INTO ENROLLMENT 
VALUES('A+',1234,2,332); 
INSERT INTO ENROLLMENT 
VALUES('B-',5919,2,245); 
INSERT INTO ENROLLMENT 
VALUES('C+',1111,1,203); 
INSERT INTO ENROLLMENT 
VALUES('D',9876,1,332); 
INSERT INTO ENROLLMENT 
VALUES('F',1111,1,245); 
INSERT INTO ENROLLMENT 
VALUES('B-',6969,1,332); 
INSERT INTO ENROLLMENT 
VALUES('B+',3579,2,332); 
INSERT INTO ENROLLMENT 
VALUES('A-',6849,1,240); 
INSERT INTO ENROLLMENT 
VALUES('A',5919,1,203); 
INSERT INTO ENROLLMENT 
VALUES('D+',2468,1,332); 
INSERT INTO ENROLLMENT 
VALUES('B',1234,1,203); 
INSERT INTO ENROLLMENT 
VALUES('C-',9876,2,245); 
INSERT INTO ENROLLMENT 
VALUES('A-',2468,2,245); 
INSERT INTO ENROLLMENT 
VALUES('A',6969,1,203); 
INSERT INTO ENROLLMENT 
VALUES('D-',3579,1,245); 
INSERT INTO ENROLLMENT 
VALUES('C',3579,1,240); 
INSERT INTO ENROLLMENT 
VALUES('C+',6969,2,245); 
INSERT INTO ENROLLMENT 
VALUES('B+',2468,1,240);
INSERT INTO ENROLLMENT 
VALUES('A+',9876,1,203); 

# Add prereqs data
INSERT INTO prereqs 
VALUES('CPSC131', 332); 
INSERT INTO prereqs 
VALUES('CPSC131', 240); 
INSERT INTO prereqs 
VALUES('MATH280', 240); 
INSERT INTO prereqs 
VALUES('PHYS226', 203); 
INSERT INTO prereqs 
VALUES('MATH250A', 203); 
INSERT INTO prereqs 
VALUES('CPSC120', 203); 
INSERT INTO prereqs 
VALUES('Col.Algebra/3 yrs HS math', 245); 

# Add college_degrees data
INSERT INTO college_degrees 
VALUES('Ph.D., University of California, Irvine, California', 4567); 
INSERT INTO college_degrees 
VALUES('Ph.D., Western Michigan University, Michigan', 3366); 
INSERT INTO college_degrees 
VALUES('Ph.D., University of Nevada, Las Vegas', 3697); 
INSERT INTO college_degrees 
VALUES('Ph.D., University of Southern California, California', 6543); 

#Add prof_titles data
INSERT INTO prof_titles 
VALUES('Professor', 4567); 
INSERT INTO prof_titles 
VALUES('Professor', 3366); 
INSERT INTO prof_titles 
VALUES('Department Chair', 4567); 
INSERT INTO prof_titles 
VALUES('Department Chair', 3366); 
INSERT INTO prof_titles 
VALUES('Assistant Professor', 3697); 
INSERT INTO prof_titles 
VALUES('Associate Professor', 6543); 