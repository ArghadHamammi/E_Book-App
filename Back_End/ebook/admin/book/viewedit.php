<?php

include "../../connect.php";

$id = filterRequest("Book_id");

getAllData("books", "Book_id = $id");
