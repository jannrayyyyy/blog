<?php

require_once('connect.php');

$sql = "CREATE TABLE IF NOT EXISTS $table (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    createdAt VARCHAR(30) NOT NULL,
    imageUrl VARCHAR(200) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL, 
    userAddress VARCHAR(200) NOT NULL, 
    email VARCHAR(50) NOT NULL, 
    userPassword VARCHAR(50) NOT NULL
    )";

if ($connect->query($sql) === TRUE) {
    echo "success creating user";
} else {
    echo "error";
}
$connect->close();
return;

?>