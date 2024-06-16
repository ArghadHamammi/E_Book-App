<?php

include "../../connect.php";

$name = filterRequest("genre");
$namear = filterRequest("genre_ar");

$inagename =  imageUpload("../../upload/categories", "files");

$data = array(
    "genre" => $name,
    "genre_ar" => $namear,
    "genre_image" => $inagename
);
insertData("categories", $data);
