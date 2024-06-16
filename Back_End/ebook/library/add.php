 <?php
    // include "../connect.php";
    // include "../connect.php";
    // include "../function.php";
   include "../connect.php";


    $library_userid = filterRequest("library_userid");
    $library_bookid = filterRequest("library_bookid");
 



    $data = array(
        "library_userid" => $library_userid,
        "library_bookid" =>  $library_bookid,
      
    );


    insertData("library", $data);



    ?>
 