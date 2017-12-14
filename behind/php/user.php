<?php
    header('Access-Control-Allow-Origin:*');
    include "connect.php";
    $username = isset($_POST["userName"]) ? $_POST["userName"] : "";
    $password = isset($_POST["password"]) ? $_POST["password"] : "";
    $state = isset($_POST["state"]) ? $_POST["state"] : "";
    $nickName = isset($_POST["nickName"]) ? $_POST["nickName"] : "";
    $userImg = isset($_POST["userImg"]) ? $_POST["userImg"] : "";
    $dAddress = isset($_POST["dAddress"]) ? $_POST["dAddress"] : "";
    $address1 = isset($_POST["address1"]) ? $_POST["address1"] : "";
    $address2 = isset($_POST["address2"]) ? $_POST["address2"] : "";
    $update = isset($_POST["update"]) ? $_POST["update"] : "";
    // 查询数据
    if($state == "查询"){
        // $sql = "select * from user where userName = '$username'";
        $sql = "select * from user where (userName like '%$username%' or nickName like '%$username%')";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            echo json_encode($row,JSON_UNESCAPED_UNICODE);
        }else{
            // 表示数据不存在
            echo 'false';
        }
    }else if($state == "删除" && $username !== ""){
        $sql = "delete from user where userName='$username'";
        $result = $conn->query($sql);
        if($result){
            // 插入成功
            $sql = "select * from user";
             $result = $conn->query($sql);
            //使用查询结果集
            $row = $result->fetch_all(MYSQLI_ASSOC);
            // 输出结果
            if($result->num_rows>0){
                echo json_encode($row,JSON_UNESCAPED_UNICODE);
            }else{
                // 表示数据不存在
                echo 'false';
            }
        }else{
            echo "error:" . $sql . "<br>" . $conn->error;
        }
    }else if($state == "修改"){
        $sql = "UPDATE `user` SET nickName = '$nickName' , userImg = '$userImg' , dAddress = '$dAddress' , address1 = '$address1' , address2 = '$address2' , date = '$update' where userName = '$username'";
        $result = $conn->query($sql);
        if($result){
            // 插入成功
            $sql = "select * from user";
             $result = $conn->query($sql);
            //使用查询结果集
            $row = $result->fetch_all(MYSQLI_ASSOC);
            // 输出结果
            if($result->num_rows>0){
                echo json_encode($row,JSON_UNESCAPED_UNICODE);
            }else{
                // 表示数据不存在
                echo 'false';
            }
        }else{
            echo "error:" . $sql . "<br>" . $conn->error;
        }
    }else if($state == "增加"){
        $sql = "insert into `user` (userName,password,nickName,userImg,dAddress,address1,address2) values ('$username','$password','$nickName','$userImg','$dAddress','$address1','$address2')";
        $result = $conn->query($sql);
        if($result){
            // 插入成功
            $sql = "select * from user";
             $result = $conn->query($sql);
            //使用查询结果集
            $row = $result->fetch_all(MYSQLI_ASSOC);
            // 输出结果
            if($result->num_rows>0){
                echo json_encode($row,JSON_UNESCAPED_UNICODE);
            }else{
                // 表示数据不存在
                echo 'false';
            }
        }else{
            echo "error:" . $sql . "<br>" . $conn->error;
        }
    }else if($username == ""){
        $sql = "select * from user";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            echo json_encode($row,JSON_UNESCAPED_UNICODE);
        }else{
            // 表示数据不存在
            echo 'false';
        }
    // 判断是否存在该用户
    }else if($username != "" && $password != ""){
        $sql = "select * from user where userName = '$username' and password = '$password'";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            echo "true";
        }else{
            // 表示数据不存在
            echo 'false';
        }
    }else if($username != ""){
        $sql = "select * from user where userName = '$username'";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            echo json_encode($row,JSON_UNESCAPED_UNICODE);
        }else{
            echo 'true';
        }
    }
    
    // 关闭连接
    $conn->close();

?>