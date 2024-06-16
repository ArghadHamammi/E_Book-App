<?php

include "../../connect.php";

$name = filterRequest("genre");
$namear = filterRequest("genre_ar");
$id = filterRequest("categories_id");
// $image = filterRequest("imageold");


// $res =    imageUpload("../../upload/categories", "image");
// if ($res == "empty") {
    $data = array(
        "genre" => $name,
        "genre_ar" => $namear,

    );
// } else {
//     deleteFile("../../upload/categories", $image);

//     $data = array(
//         "genre" => $name,
//         "genre_ar" => $namear,
//         "genre_image" => $res

//     );
// }

updateData("categories", $data, "categories_id = $id");
