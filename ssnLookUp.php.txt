<?php 
$dbServer = "mariadb"; 
$dbUser = "cs332a19"; 
$dbPass = ; 		// Contact Sean Hatfield or Vincent Diep for Password
$ssn = $_POST['ssn']; 
 
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
// Given the social security number of a professor, list the titles, classrooms,meeting days and time of his/her classes. 
$sql = "SELECT Title, Classroom, MeetDays, B_Time, E_Time FROM PROFESSOR P, SECTION S, COURSE C 
WHERE P.SSN=S.P_SSN AND S.C_Num=C.C_Num AND P.SSN=" . $ssn . ";"; 
$result = $conn->query($sql); 
 
if ($result->num_rows > 0) { 
  echo "<h2><center>Classes for professor with SSN " .$ssn . "</center></h2>"; 
  echo '<table style="width:100%"><tr><th>Class Title</th><th>Classroom</th><th>Meeting 
Days</th><th>Beginning Time</th><th>Ending Time</th></tr>';
// Print each row using a loop to loop through result of the query 
  while($row = $result->fetch_assoc()) { 
    // Generate each row in html for the table 
    echo "<tr><td>" . $row["Title"] . "</td><td>" . $row["Classroom"] . "</td><td>" . $row["MeetDays"] . 
"</td><td>" . $row["B_Time"] . "</td><td>" . $row["E_Time"] . "</td></tr>"; 
  } 
  echo "</table>"; 
} else { 
  echo "No results found."; 
} 
echo '</body></html>'; 
// Close the connection to the database 
$conn->close(); 
?>