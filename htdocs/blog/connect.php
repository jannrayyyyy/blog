<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$table = "users";
$connect = mysqli_connect('localhost', 'root', '', 'blog');

?>