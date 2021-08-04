<?php 
$dbServer = "mariadb"; 
$dbUser = "cs332a19"; 
$dbPass = ; 		// Contact Sean Hatfield or Vincent Diep for Password
$c_num = $_POST['c_num']; 
 
// Connect to the database 
$conn = new mysqli($dbServer, $dbUser, $dbPass, $dbUser); 
 
// Throw an error if we cannot connect to the database 
if($conn->connect_error){ 
        die("Connection failed: " . $conn->connect_error); 
} 
 
// Style the table in html 
echo '<html><body> 
<style> 
table, th, td { 
  border: 1px solid black; 
  border-collapse: collapse; 
} 
</style>'; 
// Given a course number list the sections of the course, including the class-rooms, the meeting days and time, and 
the number of students enrolled in each section 
$sql = "SELECT  S.S_Num, S.Classroom, S.MeetDays,S.B_Time, S.E_Time, COUNT(*) FROM SECTION S, 
ENROLLMENT E WHERE S.C_Num=" . $c_num . " AND E.C_Num=S.C_Num AND S.S_Num=E.S_Num 
GROUP BY S.S_Num;"; 
$result = $conn->query($sql); 
 
if ($result->num_rows > 0) { 
  echo "<h2><center>Course sections with course #" . $c_num . "</center></h2>"; 
echo '<table style="width:100%"><tr><th>Section Number</th><th>Classroom</th><th>Meeting 
Days</th><th>Beginning Time</th><th>Ending Time</th><th>Students Enrolled</th></tr>'; 
  // Print each row using a loop to loop through result of the query 
  while($row = $result->fetch_assoc()) { 
    // Generate each row in html for the table 
    echo "<tr><td>" . $row["S_Num"] . "</td><td>" . $row["Classroom"] . "</td><td>" . $row["MeetDays"] . 
"</td><td>" . $row["B_Time"] . "</td><td>" . $row["E_Time"] . "</td><td>" . $row["COUNT(*)"] . "</td></tr>"; 
  } 
  echo "</table>"; 
} else { 
  echo "No results found."; 
} 
echo '</body></html>'; 
// Close the connection to the database 
$conn->close(); 
?>