<?php
include "../connect.php";


$userid = filterRequest("library_userid");
$bookid = filterRequest("library_bookid");

deleteData("library", "library_userid = $userid AND library_bookid = $bookid");
