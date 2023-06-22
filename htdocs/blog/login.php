<?php

require_once('connect.php');

$email = $_POST['email'];
$userPassword = $_POST['userPassword'];

$u = "SELECT email FROM $table WHERE email='$email' and userPassword = '$userPassword'";
$result = $connect->query($u);


if ($result->num_rows > 0) {
    $data = array("message" => "Login Succesfully", "status" => true);
    echo json_encode($data);
} else {
    $data = array("message" => "Email and Password is incorrect", "status" => false);
    echo json_encode($data);
}

?>