<?php
    include "db.php";

    $firsname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $phone = $_POST["phone"];
    $address = $_POST["address"];

    $conn -> query("insert into person(firstname, lastname, phone, address)values('".$firsname."','".$lastname."','".$phone."','".$address."')");
?>