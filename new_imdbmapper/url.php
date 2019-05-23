<?php
$Movie="$argv[1]" ;
include_once 'imdb.class.php';
$IMDB = new IMDB($Movie);
if ($IMDB->isReady) {
    print_r($IMDB->getUrl());
    } else {
    echo 'nomatch';
    }
