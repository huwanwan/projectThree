<?php
/**
 * @Author: Marte
 * @Date:   2017-12-11 19:17:19
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-11 21:42:54
 */
    include './comPHP.php';
    header('Access-Control-Allow-Origin:*');    
    $user = isset($_POST['user']) ? $_POST['user'] : "";
    $keyword = isset($_POST['keyWord']) ? $_POST['keyWord'] : "";
    $clear = isset($_POST['clear']) ? $_POST['clear'] : "";
    $array = array();
    if($clear){
        $sql = "update searchWord set keyWord='$keyword' where user='$user'";
        $result = $cont->query($sql);
        // 判断是否写入成功;
        if($result){
            echo "ok";
        }else{
            // 输出失败;
            echo "Error: " .$sql ."<br>" .$cont->error; 
        }
        $cont->close();
    }else if($keyword != ""){
        $sql = "select keyWord from searchWord where user='$user'";
        $result = $cont->query($sql);
        if($result->num_rows>0){
            $res = $result->fetch_all(MYSQLI_ASSOC);
            $result->free();
            $res = $res[0];  
            $array= $res['keyWord'];
            $array = explode(",",$array);
            if (!in_array($keyword,$array)){
                Array_unshift($array,$keyword); 
                $string = implode(',',$array);
                 $sql = "update searchWord set keyWord='$string' where user='$user'";
                    $result = $cont->query($sql);
                    // 判断是否写入成功;
                    if($result){
                        echo "ok";
                    }else{
                        // 输出失败;
                        echo "Error: " .$sql ."<br>" .$cont->error; 
                    }
                    $cont->close();
            }
        }else{
            $result->free();
            $sql = "insert into searchWord(user,keyWord)values('$user','$keyword')";
            $result = $cont->query($sql);
            // 判断是否写入成功;
            if($result){
                echo "ok";
            }else{
                // 输出失败;
                echo "Error: " .$sql ."<br>" .$cont->error; 
            }
            $cont->close();
        }
    }else{
        $sql = "select keyWord from searchWord where user='$user'";
        $result = $cont->query($sql);
        if($result->num_rows>0){
            $res = $result->fetch_all(MYSQLI_ASSOC);
            $result->free();
            $res = $res[0];  
            $array= $res['keyWord'];
            echo json_encode($array,JSON_UNESCAPED_UNICODE);
            $cont->close();
        }
    }

?>