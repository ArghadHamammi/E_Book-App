<?php

include "../connect.php";

 
$catergoryid = filterRequest("id");

 getAllData("allbook1", "categories_id = $catergoryid");

    // getAllData("allbook", "1 = 1");

 

 
