<?php
/**
 * @Author: Marte
 * @Date:   2017-12-12 11:25:30
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-12 12:03:44
 */
    include 'comPHP.php';
    header('Access-Control-Allow-Origin:*');
    $key = isset($_GET['keyWord']) ? $_GET['keyWord'] : "";
    $price = isset($_GET['price']) ? $_GET['price'] : "";
    $sale = isset($_GET['sale']) ? $_GET['sale'] : "";

    $sql = "select * from goods where details Like '%$key%'";
    if($price){
        if($price == 'desc'){
            $sql.=" order by price desc";
        }else{
            $sql.=" order by price asc";
        }
    }else if($sale){
        if($sale == 'desc'){
            $sql.=" order by saleQty desc";
        }else{
            $sql.=" order by saleQty asc";
        }
    }
    $result = $cont->query($sql);
    if($result->num_rows>0){
        $res = $result->fetch_all(MYSQLI_ASSOC);
        $result->free();
        echo json_encode($res,JSON_UNESCAPED_UNICODE);
        $cont->close();
    }
?>