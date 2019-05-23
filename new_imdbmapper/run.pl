#!/usr/bin/perl -w

use utf8;
use strict;
use warnings;
use Term::ANSIColor;

binmode (STDERR,"encoding(utf8)");

#####################################
## NewImdbMapper                   ##
## Revision 1 20190514             ##
## takealug.de                     ##
## https://github.com/sunsettrack4 ##
#####################################

#Path to php helper-scripts i.E Path to "age.php"
my $path= "imdb" ;

# Max Cachetime in Days
my $cachetime = 5; 

#Check if path to Helperscripts exist
if (-e "$path/age.php" && -e "$path/country.php"  && -e "$path/imdb.class.php"  && -e "$path/poster.php"  && -e "$path/rating.php"  && -e "$path/url.php"  && -e "$path/year.php"  )
{
    print STDERR color("green"), "Helperscripts Found OK\n", color("reset");
} else {
    die color("red"), "Can´t open one or more php Helperscripts in Folder $path, please check Line 18 in run.pl\n $!" , color("reset") ;
} 

my $num_args = $#ARGV + 1;
if ($num_args != 2) {
  print STDERR "\nArg=$num_args Usage: <script> in.xml out.xml\n";
  exit;
}

#Delete all files older $cachetime
print STDERR "Deleting all Cached Files older then $cachetime Days\n";

my $cachefolder = "$path/cache/" ;

if ( !-d $cachefolder ) {
    mkdir $cachefolder or die "Failed to create path: $cachefolder";
}

opendir(my $cache, $cachefolder);
while (readdir($cache)) {
    my $cachefiles = "$cachefolder/$_";
    if (-f $cachefiles and -M $cachefiles > $cachetime) {
        unlink $cachefiles;
    }
}

my $xmlfile=$ARGV[0];
my $xmlout=$ARGV[1];

my $xml_temp= "$path/temp/" ;

if ( !-d $xml_temp ) {
    mkdir $xml_temp or die "Failed to create path: $xml_temp";
}

print STDERR "Splitting XML in 30MB Files\n";
qx{cp "$xmlfile" "$xml_temp/workfile"};
qx{xml_split -s 30000000 "$xml_temp/workfile"};

print STDERR "Creating Index for Splitted Files\n";
qx{cp "$xml_temp"workfile-00.xml "$xml_temp"mappedfile-00.xml};
qx{sed -i 's/workfile/mappedfile/g' "$xml_temp"mappedfile-00.xml};

if ( -e "$xml_temp/workfile-02.xml") {
    print STDERR "Reading XML Part 1 & Part 2 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-02.xml > "$xml_temp"mappedfile-02.xml};
} else {
    print STDERR "Reading XML Part 1\n";
    qx{"$path"/imdbtask_1.pl "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml};
}

if ( -e "$xml_temp/workfile-04.xml") {
    print STDERR "Reading XML Part 3 & Part 4 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-03.xml > "$xml_temp"mappedfile-03.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-04.xml > "$xml_temp"mappedfile-04.xml};
} else {
    if ( -e "$xml_temp/workfile-03.xml") {
      print STDERR "Reading XML Part 3\n";
      qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-03.xml > "$xml_temp"mappedfile-03.xml};
}}

if ( -e "$xml_temp/workfile-06.xml") {
    print STDERR "Reading XML Part 5 & Part 6 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-06.xml > "$xml_temp"mappedfile-06.xml};
} else {
    if ( -e "$xml_temp/workfile-05.xml") {
      print STDERR "Reading XML Part 5\n";
      qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml};
}}

if ( -e "$xml_temp/workfile-08.xml") {
    print STDERR "Reading XML Part 7 & Part 8 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-07.xml > "$xml_temp"mappedfile-07.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-08.xml > "$xml_temp"mappedfile-08.xml};
} else {
    if ( -e "$xml_temp/workfile-07.xml") {
      print STDERR "Reading XML Part 7\n";
      qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-07.xml > "$xml_temp"mappedfile-07.xml};
}}

if ( -e "$xml_temp/workfile-10.xml") {
    print STDERR "Reading XML Part 9 & Part 10 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-10.xml > "$xml_temp"mappedfile-10.xml};
} else {
    if ( -e "$xml_temp/workfile-09.xml") {
      print STDERR "Reading XML Part 9\n";
      qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml};
}}

if ( -e "$xml_temp/workfile-12.xml") {
    print STDERR "Reading XML Part 11 & Part 12 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-11.xml > "$xml_temp"mappedfile-11.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-12.xml > "$xml_temp"mappedfile-12.xml};
} else {
    if ( -e "$xml_temp/workfile-11.xml") {
      print STDERR "Reading XML Part 11\n";
      qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-11.xml > "$xml_temp"mappedfile-11.xml};
}}


print STDERR "Merging Splitted XML Files together\n";
qx{xml_merge -o $xmlout "$xml_temp"mappedfile-00.xml};

print STDERR "Deleting Workfiles\n";
qx{rm -rf "$xml_temp"};
1;

