<?php

include "../connect.php";

$users_name = filterRequest("users_name");
$users_email = filterRequest("users_email");
$users_phone = filterRequest("users_phone");
$users_password = sha1($_POST["users_password"]);



$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? OR users_phone = ? ");
$stmt->execute(array($users_email,$users_phone));
$count =$stmt->rowCount();
if ($count >0 ){
    printfailure("PHONE OR EMAIL EXIST");
}else{
    $data= array(
        "users_name" => $users_name ,
        "users_email" => $users_email ,
        "users_phone" => $users_phone ,
        "users_password" => $users_password ,
    );
    insertData("users",$data);
}