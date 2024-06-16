<?php

include "../connect.php";


$userid = filterRequest("library_userid");
$bookid = filterRequest("library_bookid");


$stmt = $con->prepare("SELECT * FROM `library` WHERE library_userid = $userid and library_bookid = $bookid");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
