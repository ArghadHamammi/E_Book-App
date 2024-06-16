<?php

include "../../connect.php";

$title = filterRequest("book_title");
$auther = filterRequest("book_auther");
$link = filterRequest("book_link");
$date = filterRequest("data_published");
$publisher = filterRequest("book_publisher");
$cat = filterRequest("Book_ca");




$inagename =  imageUpload("../../upload/booksimage", "files");

$data = array(
    "book_title" => $title,
    "book_auther" => $auther,
    "book_link" => $link,
    "data_published" => $date,
    "book_publisher" => $publisher,
    "Book_image" => $inagename,
    "Book_ca" => $cat


);
insertData("books", $data);
