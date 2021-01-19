<?php
    include "db.php";

    $id = $_POST["id"];

    $conn -> query("delete from person where id = '".$id."'");
?>