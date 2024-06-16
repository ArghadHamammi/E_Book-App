<?php

include "../connect.php";


 
$userid = filterRequest("library_userid");
//  getAllData("allbook", "categories_id = $catergoryid");

// getAllData("allbook", "1 = 1");

$stmt = $con->prepare("SELECT all_library.* from all_library
  INNER JOIN library on library.library_bookid=all_library.Book_id AND library.library_userid =$userid

  ");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
