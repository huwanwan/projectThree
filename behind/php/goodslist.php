<?php
    header('Access-Control-Allow-Origin:*');

    include "DBHelp.php";

    $paramsId = isset($_GET['goodId']) ? $_GET['goodId'] : '';

    $sql = "select * from goods";

    if($paramsId){
        $sql .=" where id='$paramsId'";
    }
    $result = query($sql);

    echo json_encode($result, JSON_UNESCAPED_UNICODE);
?>
