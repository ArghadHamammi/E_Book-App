<?php

include "../connect.php";


$userid = filterRequest("userid");
$bookid = filterRequest("bookid");
$ratingnum = filterRequest("rating");

//  getAllData("allbook", "categories_id = $catergoryid");

// getAllData("allbook", "1 = 1");

$stmt = $con->prepare("INSERT INTO `rating`(`rating_userid`, `rating_bookid`, `rating`) VALUES ($userid,$bookid,$ratingnum)");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
