<?php
    include "db.php";

    $id = $_POST["id"];
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $phone = $_POST["phone"];
    $address = $_POST["address"];

    $conn -> query("update person set firstname = '".$firstname."',lastname = '".$lastname."',phone = '".$phone."',address = '".$address."' where id = '".$id."'");
?>