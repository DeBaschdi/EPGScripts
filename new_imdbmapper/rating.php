<?php
$Movie="$argv[1]" ;
include_once 'imdb.class.php';
$IMDB = new IMDB($Movie);
if ($IMDB->isReady) {
    print_r($IMDB->getRating());print_r('/10') ;
    } else {
    echo 'nomatch';
    }
