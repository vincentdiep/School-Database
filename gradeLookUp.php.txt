<?php 
$dbServer = "mariadb"; 
$dbUser = "cs332a19"; 
$dbPass = ; 		// Contact Sean Hatfield or Vincent Diep for Password
$c_num = $_POST['c_num']; 
$s_num = $_POST['s_num']; 
 
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
// Given a course number and a section number, count how many studentsget each distinct grade, i.e.  ‘A’, ‘A-’, 
‘B+’, ‘B’, ‘B-’, etc. 
$sql = "SELECT E.Grade, Count(*) FROM COURSE C, SECTION S, ENROLLMENT E WHERE C.C_Num=" . 
$c_num ." AND S.S_Num=" . $s_num . " AND C.C_Num=S.C_Num AND S.S_Num=E.S_Num AND 
E.C_Num=C.C_Num GROUP BY E.Grade;"; 
$result = $conn->query($sql); 
 
if ($result->num_rows > 0) {
echo "<h2><center>Number of students grades with course #" .$c_num . " and section #" . $s_num . 
"</center></h2>"; 
  echo '<table style="width:100%"><tr><th>Grade</th><th>Number of Students</th></tr>'; 
  // Print each row using a loop to loop through result of the query 
  while($row = $result->fetch_assoc()) { 
    // Generate each row in html for the table 
    echo "<tr><td>" . $row["Grade"] . "</td><td>" . $row["Count(*)"] . "</td></tr>"; 
  } 
  echo "</table>"; 
} else { 
  echo "No results found."; 
} 
echo '</body></html>'; 
// Close the connection to the database 
$conn->close(); 
?>