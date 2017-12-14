<?php
    // 引入其他文件
    include 'connect1.php';
    header('Access-Control-Allow-Origin:*');


    $name = isset($_GET['name']) ? $_GET['name'] : '';//查询
    
    
    $data = isset($_GET['data']) ? $_GET['data'] : '';
    $arrdata = json_decode($data);//增加


    $dataId = isset($_GET['id']) ? $_GET['id'] : '';//删除

    
    $dataUpdate = isset($_GET['dataUpdate']) ? $_GET['dataUpdate'] : '';//改
    $dataUpdateArr = json_decode($dataUpdate);
    // var_dump($dataUpdateArr->name);

    if($data != ''){
        $dataName = $arrdata->name;

        $Asql = "select name from goods where name = '$dataName'";
        $Ares = $conn->query($Asql);
        if($Ares->num_rows > 0){
            echo '当前商品已存在';
        }else{
            $barCode = $arrdata->barCode;
            $name = $arrdata->name;
            $type = $arrdata->type;
            $brand = $arrdata->brand;
            $standard = $arrdata->standard;
            $price = $arrdata->price;
            $salePrice = $arrdata->salePrice;
            $sqladd = "INSERT INTO `goods` (barCode, name, type, brand, standard, price, salePrice) VALUES ('$barCode', '$name', '$type', '$brand', '$standard', '$price', '$salePrice')";
            $res = $conn->query($sqladd);
            echo '添加成功';
        }
    };
    
    //删
    if($dataId != ''){
        $sqldel = "DELETE FROM goods WHERE id = $dataId";
        $resdel = $conn->query($sqldel);
        echo '删除成功';
    };

    //查询
    if($data == ''){
        $sql = "select * from goods";
        $result = $conn->query($sql);
        $row = $result->fetch_all(MYSQLI_ASSOC);
        echo json_encode($row,JSON_UNESCAPED_UNICODE);
    };
    
// $sql = "UPDATE `user` SET nickName = '$nickName' , userImg = '$userImg' , dAddress = '$dAddress' , address1 = '$address1' , address2 = '$address2' , date = '$update' where userName = '$username'";
    //改
    if($dataUpdate != ''){
        $barCode = $dataUpdateArr->barCode;
        $id = $dataUpdateArr->id;
        $name = $dataUpdateArr->name;
        $type = $dataUpdateArr->type;
        $brand = $dataUpdateArr->brand;
        $standard = $dataUpdateArr->standard;
        $price = $dataUpdateArr->price;
        $salePrice = $dataUpdateArr->salePrice;
        $sqlUpdate = "UPDATE `goods` SET barCode = '$barCode' , name = '$name', type = '$type', brand = '$brand', standard = '$standard', price = '$price', salePrice = '$salePrice' WHERE id  = '$id'";
            // echo $conn->error;
        $resUpdate = $conn->query($sqlUpdate);
        echo '修改成功';
    };
    
?>