<?php
    header('Access-Control-Allow-Origin:*' );

    include "DBHelp.php";

    $sql = "select * from goods";

    $result = query($sql);
   echo json_encode($result, JSON_UNESCAPED_UNICODE);
?>
