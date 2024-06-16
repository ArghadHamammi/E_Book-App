<?php
include "../connect.php";


$userid = filterRequest("userid");
$bookid = filterRequest("bookid");

deleteData("favorite", "favorite_userid = $userid AND favorite_bookid = $bookid");