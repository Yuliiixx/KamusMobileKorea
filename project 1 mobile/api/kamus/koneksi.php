<?php

$koneksi = mysqli_connect("localhost", "root", "", "kamus");

if ($koneksi) {

    //echo "Success connection";

} else {
    echo "Failed Connection";
}

?>
