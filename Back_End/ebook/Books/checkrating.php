
<?php

include "../connect.php";


$bookid = filterRequest("bookid");
$userid = filterRequest("userid");
//  getAllData("allbook", "categories_id = $catergoryid");

// getAllData("allbook", "1 = 1");

$stmt = $con->prepare("SELECT `rating` FROM `rating` WHERE rating_userid =$userid and rating_bookid=$bookid");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
