<?php

include "../connect.php";

$search = filterRequest("search");

// getAllData("allbook1", "book_title LIKE '%$search%' OR 	book_auther LIKE '%$search%' OR   	data_published LIKE '%$search%'  ");


$stmt=$con->prepare("SELECT * from allbook1 where  book_title LIKE '%$search%' OR 	book_auther LIKE '%$search%' OR   	data_published LIKE '%$search%' ");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}


 
