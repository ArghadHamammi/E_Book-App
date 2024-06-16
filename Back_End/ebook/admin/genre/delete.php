<?php

include "../../connect.php";

$id = filterRequest("categories_id");
$inagename= filterRequest("genre_image");

 

deleteFile("../../upload/categories", $inagename);
deleteData("categories", "categories_id = $id");
deleteData("books" , "Book_ca  = $id");
