<?php
    include "db.php";
    $query = $conn -> query("select * from person");
    $result = array();

    while($rowData = $query ->fetch_assoc()){
        $result[] = $rowData;
    }

    echo json_encode($result);
?>