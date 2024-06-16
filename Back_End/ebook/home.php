<?php

include "connect.php";

$alldata = array();
$alldata['status'] = "success";

$categories = getAllData("categories",null , null, false);
$alldata['categories'] = $categories ;

$allbook = getAllData("allbook1", null, null, false);
$alldata['allbook'] = $allbook;


echo json_encode($alldata);
?>