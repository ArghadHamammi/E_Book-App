<?php

include "../connect.php";



$bookid = filterRequest("library_bookid");
//  getAllData("allbook", "categories_id = $catergoryid");

// getAllData("allbook", "1 = 1");

$stmt = $con->prepare(" UPDATE `library` SET  `complete`='0' WHERE library_bookid = $bookid
  ");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
