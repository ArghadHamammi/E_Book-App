<?php

use LDAP\Result;

include "../connect.php";

$users_email = filterRequest("users_email");
$users_password = sha1($_POST["users_password"]);
//$stmt = $con->prepare("SELECT * FROM users WHERE `users_email` = ? AND `users_password` = ? ");
//$stmt->execute(array($users_email,$users_password));
//$count =$stmt->rowCount();
//if ($count >0 ){
  // echo json_encode(array("status" => "success"));
//}else{
  // echo json_encode(array("status" => "failure"));
//}
 getData("users"," `users_email` = ? AND `users_password` = ? ",array($users_email,$users_password));