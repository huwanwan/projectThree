<?php
/**
 * @Author: Marte
 * @Date:   2017-12-12 15:24:51
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-12 20:10:39
 */
    include 'comPHP.php';
    header('Access-Control-Allow-Origin:*');
    $userName = isset($_GET['userName']) ? $_GET['userName'] : "";
    $goodsId = isset($_GET['goodsId']) ? $_GET['goodsId'] : "";
    $type = isset($_GET['type']) ? $_GET['type'] : "";
    $sql = "select * from cart where userName='$userName'";
    $array = array();
    $result = $cont->query($sql);
    if($result->num_rows > 0){
        $res = $result->fetch_all(MYSQLI_ASSOC);
        $result->free();
        $res = $res[0]['goodsId'];
        if(strrchr($res,",")=="," ){

            $res = substr($res,0,-1);
        }
        if(strpos($res,',')){
            $array = explode(',',$res);
        }else{
            Array_unshift($array,$res);
        }
    
        if($goodsId!=""){
            if($type=="change"){
                $string = $goodsId;
            }else{
                Array_unshift($array,$goodsId); 
                $string = implode(',',$array);
               
            }
            $sql = "update cart set goodsId='$string' where userName='$userName'";
            $result = $cont->query($sql);
            // 判断是否写入成功;
            if($result){
                echo "ok";
            }else{
                // 输出失败;
                echo "Error: " .$sql ."<br>" .$cont->error; 
            }
            $cont->close();     
        }else{
            if($type=="change"){
                $sql = "update cart set goodsId='' where userName='$userName'";
                $result = $cont->query($sql);
                // 判断是否写入成功;
                if($result){
                    echo "ok";
                }else{
                    // 输出失败;
                    echo "Error: " .$sql ."<br>" .$cont->error; 
                }
                $cont->close();  
            }else{
                $row = array();
                if($array[0] === ""){
                    echo "none";
                }else{
                    for ($i= 0;$i< count($array); $i++){
                        if($array[$i] == ""){
                            return;
                        } 
                        $sql = "select * from goods where id = $array[$i]";
                        $result = $cont->query($sql);
                        $res = $result->fetch_all(MYSQLI_ASSOC);
                        $result->free();
                        Array_unshift($row,$res[0]); 
                    } 
                    echo json_encode($row,JSON_UNESCAPED_UNICODE);
                }
            }
        }  
    }else{
        if($goodsId!=""){
            $sql = "insert into cart(userName,goodsId)values('$userName','$goodsId')";
            $result = $cont->query($sql);
            // 判断是否写入成功;
            if($result){
                echo "ok";
            }else{
                // 输出失败;
                echo "Error: " .$sql ."<br>" .$cont->error; 
            }
        }else{
            echo "none";
        }
        $cont->close();
    }
?>