<?php
    // 引入其他文件
    include 'connect1.php';
    header('Access-Control-Allow-Origin:*');
    $name1 = isset($_GET['name']) ? $_GET['name'] : '';
    $name2 = isset($_POST['name']) ? $_POST['name'] : '';
    
    if($name1!=''){
        $name=$name1;
    }else{
         $name=$name2;
    }
    
    $sql = "select * from repertory";


    // 利用sql语句查询数据库
    // 查询结果集
    $result = $conn->query($sql);

    // var_dump($result);

    // 使用查询结果集
    
    // 
    
   
    $row = $result->fetch_all(MYSQLI_ASSOC);
    
    echo json_encode($row,JSON_UNESCAPED_UNICODE);


    
?>