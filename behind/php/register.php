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

    
    if($password == "" && $username != ""){
        $sql = "select * from User where userName = '$username'";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            // 表示用户名已存在
            echo 'false';
        }else{
            // 表示用户名可用
            echo 'true';
        }
    }else if($password != "" && $username != ""){
        // 给密码加密
        $password = md5($password);
        // 将数据写入数据库并返回信息
        // 将数据写进数据库
        $sql = "insert into User(userName,password) values ('$username','$password')";
        // 获取查询结果
        $result = $conn->query($sql);
        if($result){
            // 插入成功
            echo "ok";
        }else{
            echo "error:" . $sql . "<br>" . $conn->error;
        }
    }
    // 关闭连接
    $conn->close();
?>