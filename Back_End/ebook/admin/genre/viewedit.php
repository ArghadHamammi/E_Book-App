<?php

include "../../connect.php";

$id = filterRequest("categories_id");

getAllData("categories", "categories_id = $id");
