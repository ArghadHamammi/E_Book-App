<?php

use LDAP\Result;

include "../connect.php";

$admin_email = filterRequest("admins_email");
$admin_password = sha1($_POST["admins_password"]);
//$stmt = $con->prepare("SELECT * FROM users WHERE `users_email` = ? AND `users_password` = ? ");
//$stmt->execute(array($users_email,$users_password));
//$count =$stmt->rowCount();
//if ($count >0 ){
// echo json_encode(array("status" => "success"));
//}else{
// echo json_encode(array("status" => "failure"));
//}
getData("admin", " `admins_email` = ? AND `admins_password` = ? ", array($admin_email, $admin_password));
