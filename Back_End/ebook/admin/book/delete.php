<?php

include "../../connect.php";

$id = filterRequest("Book_id");
$inagename = filterRequest("Book_image");



deleteFile("../../upload/booksimage", $inagename);
deleteData("books", "Book_id = $id");
