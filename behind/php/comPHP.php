<?php
/**
 * @Author: Marte
 * @Date:   2017-12-10 12:22:10
 * @Last Modified by:   Marte
 * @Last Modified time: 2017-12-10 14:25:11
 */
    $servername = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'jiuniangwang';
    $cont = new mysqli($servername,$username,$password,$database);
    if($cont -> connect_errno){
        die("连接失败".$connect_errno);
    }
    // 转成utf-8码;
    $cont->set_charset("utf8");
?>