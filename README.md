
# University Database Project

## Website URL: 
http://ecs.fullerton.edu/~cs332a19/

## Group Members: 
- Vincent Diep  vincentdiep@csu.fullerton.edu
- Sean Hatfield shatfield4@csu.fullerton.edu

===========================================================================================

# Project Description:

### Web database application built using MySQL database and PHP.

The university database is designed to satisfy the following conditions:

- The database keeps information of each professor, including the social security number , name, address, telephone number, sex, title, salary, and college degrees. The address includes street address, city, state, and zip code. 
- Each department has a unique number, name, telephone, office location, and a chairperson who is a professor. 
- Each course has a unique number, title, textbook, units. Each course also has a set of prerequisite courses. Each course is offered by a department.
- Each course may have several sections. Each section has a section number that is unique within the course, a classroom, a number of seats, meeting days, a beginning time, and an ending time. Each section is taught by a professor.
- The database keeps student records, including the campus wise ID, name, address, and telephone number. Each majors in one department and may minor in several departments. The name includes first name and last name.
- The database keeps enrollment records. Each record has a student, a course section, and a grade.


### The following are queries that were implemented into the database:
- Given the social security number of a professor, list the titles, classrooms, meeting days and time of his/her classes.
- Given a course number and a section number, count how many students get each distinct grade.
- Given a course number list the sections of the course, including the classrooms, the meeting days and time, and the number of students enrolled in each section.
- Given the campus wide ID of a student, list all courses the student took and the grades. 

### Sample Interfaces
![TermProjectHome](https://user-images.githubusercontent.com/51553736/133872278-956c666a-883d-4989-92a8-25f03f07d26e.PNG)

![TermProjectProf](https://user-images.githubusercontent.com/51553736/133872282-bee5282f-e9c7-4561-a08b-0b057d0b6e5a.PNG)

![TermProjectStudent](https://user-images.githubusercontent.com/51553736/133872284-93797178-79f7-489c-82a9-81fefde6d729.PNG)

