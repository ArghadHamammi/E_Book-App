<?php

include "../connect.php";

$adminname = filterRequest("admins_name");
$adminemail = filterRequest("admins_email");
$adminpassword = sha1($_POST["admins_password"]);
 
 
$stmt = $con->prepare("SELECT * FROM `admin` WHERE admins_email = ?  ");
$stmt->execute(array($adminemail));
$count =$stmt->rowCount();
if ($count >0 ){
    printfailure("PHONE OR EMAIL EXIST");
}else{
    $data= array(
        "admins_name" => $adminname ,
        "admins_email" => $adminemail ,
        "admins_password" => $adminpassword ,
    );
    insertData("admin",$data);
}