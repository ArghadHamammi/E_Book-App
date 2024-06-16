<?php


define("MB", 1048576);

function filterRequest($requestname)
{
    return  htmlspecialchars(strip_tags($_POST[$requestname]));
}
//جلب البيانات من قواعد البيانات
function getAllData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    if ($where == null) {
        $stmt = $con->prepare("SELECT  * FROM $table ");
    } else {
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    } else {
        if ($count > 0) {
            return $data;
        } else {
            return json_encode(array("status" => "failure"));
        }
    }
}

function getData($table, $where = null, $values = null)
{
    global $con;
    $data = array();
    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    return $count;
}
//اضافة البيانات
function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

//تحديث البيانات
function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

//حذف البيانات
function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}
//رفع الصورة
function imageUpload($dir, $imageRequest)
{
    if (isset($_FILES[$imageRequest])) {
        global $msgError;
        $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
        $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
        $imagesize  = $_FILES[$imageRequest]['size'];
        $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
        $strToArray = explode(".", $imagename);
        $ext        = end($strToArray);
        $ext        = strtolower($ext);

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
        }
        if ($imagesize > 2 * MB) {
            $msgError = "size";
        }
        if (empty($msgError)) {
            move_uploaded_file($imagetmp,  $dir . "/" . $imagename);
            return $imagename;
        } else {
            return "fail";
        }
    } else {
        return "empty";
    }
}
// function imageUpload($dir, $imageRequest)
// {
//     global $msgError;
//     if (isset($_FILES[$imageRequest]) && is_uploaded_file($_FILES[$imageRequest]['tmp_name'])) {
//         $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
//         $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
//         $imagesize  = $_FILES[$imageRequest]['size'];
//         $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
//         $strToArray = explode(".", $imagename);
//         $ext        = end($strToArray);
//         $ext        = strtolower($ext);

//         $imageInfo = getimagesize($imagetmp);
//         if (!$imageInfo || !in_array($ext, $allowExt)) {
//             $msgError = "Invalid image format or size";
//         }
//         if ($imagesize > 2 * MB) {
//             $msgError = "Image size exceeds limit";
//         }
//         if (empty($msgError)) {
//             if (move_uploaded_file($imagetmp, $dir . "/" . $imagename)) {
//                 return $imagename;
//             } else {
//                 $msgError = "Failed to move uploaded file";
//             }
//         }
//     } else {
//         $msgError = "No file uploaded";
//     }
//     return "fail";
// }


//حذف الملف

function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}
//الحماية
function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "Arghad" ||  $_SERVER['PHP_AUTH_PW'] != "arghad12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 


}
function printfailure($messsage = "none")
{
    echo json_encode(array(
        "status" => "failure", "message" => $messsage
    ));
}


function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(

        'Authorization: key=' . "AAAAPloTxNQ:APA91bFMWAYR-BG9peAy9sCS8OQr18vA3gEjZlV0klQUv_JcitaEuZ5hZgAz0Gxcm7GzAusv7eYt5-j0kK6gl1Hk_4eiT5ORvOJFxmOMin3Tg7jjhol_-gw-5c-tt7Yf6P9Xv2shdGSF",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}

function notificationlist($title, $body)
{
    global $con;
    $stmt = $con->prepare("INSERT INTO `notification`(`notification_title`, `notification_body`) VALUES (?,?)");
    $stmt->execute(array($title, $body));
    sendGCM($title, $body, "users", " ", " ");
    $cont = $stmt->rowCount();
    return $cont;
}
