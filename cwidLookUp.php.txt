<?php 
$dbServer = "mariadb"; 
$dbUser = "cs332a19"; 
$dbPass = ; 		// Contact Sean Hatfield or Vincent Diep for Password
$cwid = $_POST['cwid']; 
 
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
// Given the campus wide ID of a student, list all courses the student took and the grades. 
$sql = "SELECT C.Title, C.C_Num, E.Grade FROM STUDENT ST, COURSE C, ENROLLMENT E WHERE 
ST.CWID=" . $cwid . " AND ST.CWID=E.ST_CWID AND E.C_Num=C.C_Num;"; 
$result = $conn->query($sql); 
 
if ($result->num_rows > 0) { 
  echo "<h2><center>Courses taken by student with CWID " . $cwid . "</center></h2>"; 
  echo '<table style="width:100%"><tr><th>Course Title</th><th>Course Number</th><th>Grade</th></tr>'; 
  // Print each row using a loop to loop through result of the query 
while($row = $result->fetch_assoc()) { 
    // Generate each row in html for the table 
    echo "<tr><td>" . $row["Title"] . "</td><td>" . $row["C_Num"] . "</td><td>" . $row["Grade"] . "</td></tr>"; 
  } 
  echo "</table>"; 
} else { 
  echo "No results found."; 
} 
echo '</body></html>'; 
// Close the connection to the database 
$conn->close(); 
?>