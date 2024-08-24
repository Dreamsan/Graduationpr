<?php
$servername = "localhost";
$username = "root";  // Use your actual MySQL username
$password = "";  // Use your actual MySQL password, if any
$dbname = "aloneinthedarkness";  // Ensure this is the correct database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully<br>";

// Your query logic here
$sql = "SELECT player_name, password FROM player";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "player_name: " . $row["player_name"]." password: " . $row["password"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
