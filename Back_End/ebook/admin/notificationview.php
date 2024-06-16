<?php

include "../connect.php";
 

$stmt = $con->prepare("SELECT * from notification ORDER BY notification_id");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0) {
     echo json_encode(array("status" => "success", "data" => $data));
} else {
     echo json_encode(array("status" => "failure"));
}
