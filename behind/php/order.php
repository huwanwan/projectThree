<?php
    header('Access-Control-Allow-Origin:*');
    include "connect.php";
    $username = isset($_GET["userName"]) ? $_GET["userName"] : "";
    $state = isset($_GET["state"]) ? $_GET["state"] : "";
    $orderid = isset($_GET["orderid"]) ? $_GET["orderid"] : "";
    $goodsid = isset($_GET["goodsid"]) ? $_GET["goodsid"] : "";
    // $data = isset($_POST["data"]) ? $_POST["data"] : "";
    // 取值
    // echo $data['cartOrder'];
    // SELECT `order`.orderid,`order`.state,`orderlist`.goodsid FROM `order`,`orderlist` WHERE `order`.orderid = `orderlist`.orderid and state = 1 and `order`.userName = 123
    // 数组长度
    // echo count($data);
    // 查询数据
    if($username != "" && $state != "" && $orderid == ""){
        $sql = "SELECT `order`.orderid,`order`.state,`orderlist`.goodsid FROM `order`,`orderlist` WHERE `order`.orderid = `orderlist`.orderid and state = '$state' and `order`.userName = '$username'";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // $val = $row[0][$state];
        // echo $row[0][$state];
        if($result->num_rows>0){
            $arr_1 = explode(",",$row[0]['goodsid']);
    
            $arr_2 = array();
            if($result->num_rows>0){
                for($i=0;$i<count($arr_1);++$i){
                    // var_dump($row);
                    $sql = "SELECT * FROM `goods` WHERE id = $arr_1[$i]";
                    $result = $conn->query($sql);
                    //使用查询结果集
                    $row = $result->fetch_all(MYSQLI_ASSOC);
                    $arr_2[$i] = $row[0];
                }
                echo json_encode($arr_2,JSON_UNESCAPED_UNICODE);
            }else{
                echo "error:" . $sql . "<br>" . $conn->error;
            }
        }
    }else if($username != "" && $state != "" && $orderid != "" && $goodsid != ""){
        $sql = "select * from `order` where orderid = '$orderid'";
        $result = $conn->query($sql);
        //使用查询结果集
        $row = $result->fetch_all(MYSQLI_ASSOC);
        // 输出结果
        if($result->num_rows>0){
            $sql1 = "update  `order` SET state = '$state' where userName = '$username' and orderid = '$orderid'";
            $result1 = $conn->query($sql1);
            echo "update";
        }else{
            $sql = "insert  into `order` (orderid,userName,state) values ('$orderid','$username','$state')";
            //使用查询结果集
            $sql1 = "insert into `orderlist` (orderid,goodsid) values ('$orderid','$goodsid')";
            $result = $conn->query($sql);
            $result1 = $conn->query($sql1);
            // 插入成功
            echo "ok";
        }
        
    }
    // else if($state == "添加" && $username != ""){
    //     // 购物车增加
    //     if(array_key_exists('cartOrder',$data)){
    //         $cartOrder = $data['cartOrder'];
            
    //         $sql1 = "update `order` set cartOrder = CONCAT(cartOrder ,',', '$cartOrder') where userName = '$username'";
    //         // 获取查询结果
    //         $result = $conn->query($sql1);
    //         if($result){
    //             // 插入成功
    //             echo "ok";
    //         }else{
    //             echo "error:" . $sql1 . "<br>" . $conn->error;
    //         }
    //     }
    //     // 未付款订单添加
    //     if(array_key_exists('pending',$data)){
    //         // 获取参数
    //         $pending = $data['pending'];
    //         // 获取数据库里的数据
    //         $sql2 = "SELECT pending FROM `order` WHERE userName = '$username'";
    //         // 获取查询结果
    //         $result = $conn->query($sql2);
    //         //使用查询结果集
    //         $row = $result->fetch_all(MYSQLI_ASSOC);
    //         $pending_str = str_replace("\"","",json_encode($pending));
    //         // 截取对象并拼接
    //         $str_pending = '"['.substr($row[0]['pending'],1,-1) . ',' . $pending_str .']"';
            
    //         // 写进数据库
    //         $sql3 = "update `order` set pending = $str_pending where userName = '$username'";
    //         // 获取查询结果
    //         $result = $conn->query($sql3);
    //         if($result){
    //             // 插入成功
    //             echo "ok";
    //         }else{
    //             echo "error:" . $sql3 . "<br>" . $conn->error;
    //         }
    //     }
    //     // 已付款订单添加
    //     if(array_key_exists('paid',$data)){
    //         // 获取参数
    //         $paid = $data['paid'];
    //         // 获取数据库里的数据
    //         $sql2 = "SELECT paid FROM `order` WHERE userName = '$username'";
    //         // 获取查询结果
    //         $result = $conn->query($sql2);
    //         //使用查询结果集
    //         $row = $result->fetch_all(MYSQLI_ASSOC);
    //         $paid_str = str_replace("\"","",json_encode($paid));
    //         // 截取对象并拼接
    //         $str_paid = '"['.substr($row[0]['paid'],1,-1) . ',' . $paid_str .']"';
            
    //         // 写进数据库
    //         $sql3 = "update `order` set paid = $str_paid where userName = '$username'";
    //         // 获取查询结果
    //         $result = $conn->query($sql3);
    //         if($result){
    //             // 插入成功
    //             echo "ok";
    //         }else{
    //             echo "error:" . $sql3 . "<br>" . $conn->error;
    //         }
    //     }
        
    // }else if($state == "删除" && $username !== ""){
        
    // }else if($state == "修改" && $username !== ""){
        
    // }
    
    // 关闭连接
    $conn->close();

?>