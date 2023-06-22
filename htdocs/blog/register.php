<?php

require_once('connect.php');

$id = $_POST['id'];
$createdAt = $_POST['createdAt'];
$imageUrl = $_POST['imageUrl'];
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$phoneNumber = $_POST['phoneNumber'];
$userAddress = $_POST['userAddress'];
$email = $_POST['email'];
$userPassword = $_POST['userPassword'];



$u = "SELECT email FROM $table WHERE email='$email'";
$result = $connect->query($u);

if (empty($email)) {
    $data = array("message" => "Email must not empty", "status" => false);
    echo json_encode($data);
} else if ($result->num_rows > 0) {
    $data = array("message" => "Email Already Exist!", "status" => false);
    echo json_encode($data);
} else {

    $sql = "INSERT INTO $table (id, createdAt, imageUrl, firstName, lastName, phoneNumber, userAddress, email, userPassword) VALUES('$id', '$createdAt', '$imageUrl', '$firstName', '$lastName', '$phoneNumber', '$userAddress', '$email', '$userPassword')";
    $result = $connect->query($sql);
    $data = array("message" => "Account Created Successfully", "status" => true);
    echo json_encode($data);

}

return;

?>