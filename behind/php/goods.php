<?php
    header('Access-Control-Allow-Origin:*');
    include "connect.php";
    $type = isset($_POST["type"]) ? $_POST["type"] : "";
    $price = isset($_POST["price"]) ? $_POST["price"] : "";
    $state = isset($_POST["state"]) ? $_POST["state"] : "";
    
    if($state == "true"){
        $sql = "select * from goods where type = '$type' order by $price asc";
    }else if($state == "false"){
        $sql = "select * from goods where type = '$type' order by $price desc";
    }
    $result = $conn->query($sql);
    //使用查询结果集
    $row = $result->fetch_all(MYSQLI_ASSOC);
    // 输出结果
    if($result->num_rows>0){
        // 表示用户名已存在
        echo json_encode($row,JSON_UNESCAPED_UNICODE);
    }else{
        // 表示用户名可用
        echo 'true';
    }
    // 关闭连接
    $conn->close();

?>