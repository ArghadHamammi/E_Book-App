<?php

include "../connect.php";

$userid=filterRequest("userid");


getAllData("allfavorite", "favorite_userid = ? ",array($userid));



 

?>