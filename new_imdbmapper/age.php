<?php
$Movie="$argv[1]" ;
include_once 'imdb.class.php';
$IMDB = new IMDB($Movie);
if ($IMDB->isReady) {
    $zeichenkette=($IMDB->getMpaa()) ;
    } else {
    $zeichenkette= 'nomatch';
    }

    
$suchmuster = array();
$suchmuster[0] = '/oA/';
$suchmuster[1] = '/PG-13/';
$suchmuster[2] = '/PG/';
$suchmuster[3] = '/R/';
$suchmuster[4] = '/TV-14/';
$suchmuster[5] = '/TV-G/';
$suchmuster[6] = '/TV-MA/';
$suchmuster[7] = '/TV-PG/';
$suchmuster[8] = '/TV-Y7/';
$suchmuster[9] = '/TV-Y/';
$suchmuster[10] = '/G/';
$suchmuster[11] = '/NC-17/';
$suchmuster[12] = '/NC/';
$suchmuster[13] = '/TV-6/';

$ersetzungen = array();
$ersetzungen[0] = '0';
$ersetzungen[1] = '12';
$ersetzungen[2] = '6';
$ersetzungen[3] = '16';
$ersetzungen[4] = '16';
$ersetzungen[5] = '6';
$ersetzungen[6] = '18';
$ersetzungen[7] = '6';
$ersetzungen[8] = '12';
$ersetzungen[9] = '6';
$ersetzungen[10] = '0';
$ersetzungen[11] = '18';
$ersetzungen[12] = '16';
$ersetzungen[13] = '6';

echo preg_replace($suchmuster, $ersetzungen, $zeichenkette);
