<?php

include "../connect.php";


$catergoryid = filterRequest("id");
$userid = filterRequest("userid");
 

$stmt=$con->prepare("SELECT allbook1.*,1 as favorite from allbook1
INNER JOIN favorite on favorite.favorite_bookid=allbook1.Book_id AND favorite.favorite_userid  = $userid
where categories_id = $catergoryid
UNION ALL
SELECT *,0 as favorite from allbook1 
WHERE categories_id = $catergoryid AND Book_id not IN (SELECT allbook1.Book_id from allbook1
INNER JOIN favorite on favorite.favorite_bookid=allbook1.Book_id AND favorite.favorite_userid = $userid)");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}