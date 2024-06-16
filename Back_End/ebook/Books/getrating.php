<?php

include "../connect.php";



$bookid = filterRequest("bookid");
 

//  getAllData("allbook", "categories_id = $catergoryid");

// getAllData("allbook", "1 = 1");

$stmt = $con->prepare("SELECT avg(rating) as rating FROM `rating` WHERE rating_bookid =$bookid ");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0 ) {
    echo json_encode(array(  "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
