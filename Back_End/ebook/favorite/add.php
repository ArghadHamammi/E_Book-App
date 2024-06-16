<?php
// include "../connect.php";
// include "../connect.php";
// include "../function.php";
include "../connect.php";
 
$userid=filterRequest("userid");
$bookid = filterRequest("bookid");
 


$data= array(
    "favorite_userid"=> $userid ,
    "favorite_bookid" => $bookid,
);


   insertData("favorite",$data);



?>