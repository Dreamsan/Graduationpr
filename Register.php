<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "aloneinthedarkness";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Debugging: Log the received POST parameters
file_put_contents('post_log.txt', "Received POST parameters: " . print_r($_POST, true) . "\\n", FILE_APPEND);

if (!isset($_POST['registerName']) || !isset($_POST['registerEmail']) || !isset($_POST['registerPass'])) {
    echo json_encode(array('success' => false, 'message' => 'Missing POST parameters'));
    exit();
}

$name = $_POST['registerName'];
$email = $_POST['registerEmail'];
$pass = $_POST['registerPass'];

$name = $conn->real_escape_string($name);
$email = $conn->real_escape_string($email);
$pass = $conn->real_escape_string($pass);

// Insert new user into the database
$sql = "INSERT INTO player (player_name, email, password) VALUES ('$name', '$email', '$pass')";
if ($conn->query($sql) === TRUE) {
    echo json_encode(array('success' => true, 'message' => 'Registration successful'));
} else {
    echo json_encode(array('success' => false, 'message' => 'Error: ' . $sql . '<br>' . $conn->error));
}

$conn->close();
?>
