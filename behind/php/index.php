<?php
/**
 * @Author: Marte
 * @Date:   2017-12-10 12:23:04
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-10 13:14:18
 */
  include 'comPHP.php';
  header('Access-Control-Allow-Origin:*');
  $hot = isset($_GET['hot']) ? $_GET['hot'] : "";
  $new = isset($_GET['new']) ? $_GET['new'] : "";
  $num = isset($_GET['num']) ? $_GET['num'] : "";
  $sql = "select * from goods";
  if($hot){
    $sql.=" order by saleQty desc";
  }else if($new){
    $sql.=" order by addTime desc";
  }

  $result = $cont->query($sql);
  $row = $result->fetch_all(MYSQLI_ASSOC);
  $result->free();

  if($num){
    $res = array_slice($row,0,$num);
  }else{
    $res = $row;
  }
  echo json_encode($res,JSON_UNESCAPED_UNICODE);
  $cont->close();
?>