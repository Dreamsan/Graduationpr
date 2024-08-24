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
file_put_contents('post_log.txt', "Received POST parameters: " . print_r($_POST, true) . "\n", FILE_APPEND);

if (!isset($_POST['loginUser']) || !isset($_POST['loginPass'])) {
    echo json_encode(array('success' => false, 'message' => 'Missing POST parameters'));
    exit();
}

$user = $_POST['loginUser'];
$pass = $_POST['loginPass'];

$user = $conn->real_escape_string($user);
$pass = $conn->real_escape_string($pass);

$sql = "SELECT * FROM player WHERE player_name='$user'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if ($pass == $row['password']) { // Ensure the password comparison matches your storage method
        echo json_encode(array('success' => true, 'message' => 'Login successful'));
    } else {
        echo json_encode(array('success' => false, 'message' => 'Incorrect password'));
    }
} else {
    echo json_encode(array('success' => false, 'message' => 'User does not exist'));
}

$conn->close();
?>
