<?php

// header("Access-Control-Allow-Origin: *");
// header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

require_once('connect.php');

$phoneNumber = $_POST['phoneNumber'];
$userAddress = $_POST['userAddress'];
$email = $_POST['email'];
$imageUrl = $_POST['imageUrl'];

$u = "SELECT email FROM $table";
$result = $connect->query($u);

$sql = "UPDATE $table SET phoneNumber='$phoneNumber', userAddress='$userAddress', email='$email', imageUrl='$imageUrl' WHERE email='$email'";
$result = $connect->query($sql);

if ($result->num_rows > 0) {
    $data = array("message" => "No user found!", "status" => false);
    echo json_encode($data);
} else {
    $data = array("message" => "User updated Successfully", "status" => true);
    echo json_encode($data);
}


?>