<?php

include "../connect.php";

// insertData("books", $data);

// sendGCM("d","f","users","","");

$name = filterRequest("title");
$namear = filterRequest("auther");



notificationlist($name,$namear);
 
