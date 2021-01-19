<?php
    $conn = new mysqli("localhost","root","","flutter_crud");

    if($conn -> connect_errno){
        printf("Veritabanına bağlanılamadı.", $conn -> connect_errno);
        exit();
    }
?>