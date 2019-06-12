#!/usr/bin/perl -w

use utf8;
use strict;
use warnings;
use Term::ANSIColor;

binmode (STDERR,"encoding(utf8)");

#####################################
## NewImdbMapper                   ##
## Revision 3 20190608             ##
## takealug.de                     ##
## https://github.com/DeBaschdi    ##
#####################################

#Path to php helper-scripts i.E Path to "age.php"
my $path= "imdb" ;

# Max Cachetime in Days
my $cachetime = 5;

#Check if all Files exist
if (-e "$path/age.php" && -e "$path/country.php"  && -e "$path/imdb.class.php"  && -e "$path/poster.php"  && -e "$path/rating.php"  && -e "$path/url.php"  && -e "$path/year.php" && -e "$path/imdbtask.pl" && -e "$path/worker1.pl" && -e "$path/worker2.pl" && -e "$path/bar.sh" && -e "$path/prozes.pl")
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

#Insert Pathinfo to taskfile+worker+prozes
qx{sed -i -e 13c'my \$path= "'$path'" ;' $path/imdbtask.pl} ;
qx{sed -i -e 10c'my \$path= "'$path'" ;' $path/worker1.pl} ;
qx{sed -i -e 10c'my \$path= "'$path'" ;' $path/worker2.pl} ;
qx{sed -i -e 8c'my \$path= "'$path'" ;' $path/prozes.pl} ;

#Create IMDB tasks
qx{cp "$path/imdbtask.pl" "$path/imdbtask_1.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_2.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_3.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_4.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_5.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_6.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_7.pl" && cp "$path/imdbtask.pl" "$path/imdbtask_8.pl"};
qx{chmod 0777 -R $path/*} ;

#Modify Tempfiles in taskfiles
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp2";' $path/imdbtask_2.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp3";' $path/imdbtask_3.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp4";' $path/imdbtask_4.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp5";' $path/imdbtask_5.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp6";' $path/imdbtask_6.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp7";' $path/imdbtask_7.pl} ;
qx{sed -i -e 383c'my \$tempfile="/tmp/xmltv.xml_temp8";' $path/imdbtask_8.pl} ;

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

#Check Input Filesize
my $size = -s $xmlfile;
if (($size / 300000000) > 3) {
  die color("red"), "Max Supportet Filesize is 300MB, please use smaler Filesizes\n " , color("reset") ;
}

my $thread ="";
$thread = qx{ps ax};

print STDERR "Create Status Bar\n";
system "echo '#!/bin/bash' > $path/status.sh";
system "echo 'source $path\/bar.sh' >> $path/status.sh";
system "echo 'ARGV1\=\$1' >> $path/status.sh";
system "echo '\$ARGV1' >> $path/status.sh";
system "chmod 0777 $path/status.sh";



my $splitfiles = '49';
my $splitsize = $size / $splitfiles ;
$splitsize = int($splitsize);

print STDERR "Splitting XML in $splitfiles Files\n";


qx{cp "$xmlfile" "$xml_temp/workfile"};


system "$path/status.sh setup_scroll_area";
sleep(1);
system "$path/prozes.pl & xml_split -s $splitsize $xml_temp/workfile";
sleep(1);
system "$path/status.sh destroy_scroll_area";


print STDERR "Creating Index for Splitted Files\n";
system"cp $xml_temp/workfile-00.xml $xml_temp/mappedfile-00.xml";
qx{sed -i 's/workfile/mappedfile/g' "$xml_temp"mappedfile-00.xml};

system "$path/status.sh setup_scroll_area";
sleep(1);
system "perl $path/prozes.pl & perl $path/worker1.pl & perl $path/worker2.pl";

sub wait_for_worker { 
    my $thread = qx{ps ax};
    if ($thread=~ m/imdb\/worker1/ || $thread=~ m/imdb\/worker2/ )  { 
        sleep(4);
        wait_for_worker();
    }
}


wait_for_worker();

sleep(1);

print STDERR color("green"), "\nIMDB SERARCH COMPLETE!\n", color("reset");
system "$path/status.sh 'draw_progress_bar 100' ";
sleep(2);
system "$path/status.sh destroy_scroll_area";
sleep(1);


print STDERR "Merging Splitted XML Files together\n";
qx{xml_merge -o $xmlout "$xml_temp"mappedfile-00.xml};

wait;

print STDERR "Deleting Workfiles\n";
qx{rm -rf "$xml_temp"};
qx{rm $path/imdbtask_*};

exit;


