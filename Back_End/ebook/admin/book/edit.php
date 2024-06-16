<?php

include "../../connect.php";


$title = filterRequest("book_title");
$auther = filterRequest("book_auther");
$link = filterRequest("book_link");
$date = filterRequest("data_published");
$publisher = filterRequest("book_publisher");
$cat = filterRequest("Book_ca");
$id = filterRequest("Book_id");
// $image = filterRequest("imageold");


// $res =    imageUpload("../../upload/booksimage", "image");
// if ($res == "empty") {
    $data = array(
        "book_title" => $title,
        "book_auther" => $auther,
        "book_link" => $link,
        "data_published" => $date,
        "book_publisher" => $publisher,
        "Book_ca" => $cat

    );
// } else {
//     deleteFile("../../upload/categories", $image);

//     $data = array(
//         "book_title" => $title,
//         "book_auther" => $auther,
//         "book_link" => $link,
//         "data_published" => $date,
//         "book_publisher" => $publisher,
         
//         "Book_ca" => $cat,
//         "Book_image" => $res


//     );
// }

updateData("books", $data, "Book_id = $id");
