<?php
/**
 * @Author: Marte
 * @Date:   2017-12-10 14:09:13
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-10 14:30:50
 */
    include 'comPHP.php';
    header('Access-Control-Allow-Origin:*');

    $type = isset($_GET['type']) ? $_GET['type'] : "";

    $sql = "select * from adverImage";
    if($type){
        $sql.=" where type='$type'";
    }
    $result = $cont->query($sql);
    $row = $result->fetch_all(MYSQLI_ASSOC);
    $result->free();
    echo json_encode($row,JSON_UNESCAPED_UNICODE);
    $cont->close();
?>