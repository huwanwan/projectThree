<?php
/**
 * @Author: Marte
 * @Date:   2017-12-06 17:26:10
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-06 17:34:17
 */
    header('Access-Control-Allow-Origin:*');
    include "connect.php";

    $username = isset($_GET["userName"]) ? $_GET["userName"] : "";
    $password = isset($_GET["password"]) ? $_GET["password"] : "";

    // 给密码加密
    $password = md5($password);

    $sql = "select * from User where userName = '$username' and password = '$password'";
    $result = $conn->query($sql);
    //使用查询结果集
    $row = $result->fetch_all(MYSQLI_ASSOC);
    // 输出结果
    if($result->num_rows>0){
        echo 'true';
    }else{
        echo 'false';
    }
    // 关闭连接
    $conn->close();
?>