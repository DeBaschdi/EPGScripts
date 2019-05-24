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
if (-e "$path/age.php" && -e "$path/country.php"  && -e "$path/imdb.class.php"  && -e "$path/poster.php"  && -e "$path/rating.php"  && -e "$path/url.php"  && -e "$path/year.php" && -e "$path/imdbtask_1.pl" && -e "$path/imdbtask_2.pl" && -e "$path/imdbtask_3.pl" && -e "$path/imdbtask_4.pl" )
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

my $thread ="";
$thread = qx{ps ax};

print STDERR "Splitting XML in 11MB Files\n";
qx{cp "$xmlfile" "$xml_temp/workfile"};
qx{xml_split -s 11000000 "$xml_temp/workfile"};

print STDERR "Creating Index for Splitted Files\n";
qx{cp "$xml_temp"workfile-00.xml "$xml_temp"mappedfile-00.xml};
qx{sed -i 's/workfile/mappedfile/g' "$xml_temp"mappedfile-00.xml};

if ( -e "$xml_temp/workfile-04.xml")
{
    print STDERR "Reading XML Part 1 2,3 and 4 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-02.xml > "$xml_temp"mappedfile-02.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-03.xml > "$xml_temp"mappedfile-03.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-04.xml > "$xml_temp"mappedfile-04.xml};
    }
    elsif ( -e "$xml_temp/workfile-03.xml")
    {
        print STDERR "Reading XML Part 1, 2 and 3 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-02.xml > "$xml_temp"mappedfile-02.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-03.xml > "$xml_temp"mappedfile-03.xml};
            }
            elsif ( -e "$xml_temp/workfile-02.xml")
            {
                print STDERR "Reading XML Part 1 and 2 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-02.xml > "$xml_temp"mappedfile-02.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-01.xml")
                     {
                        print STDERR "Reading XML Part 1\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-01.xml > "$xml_temp"mappedfile-01.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-08.xml")
{
    print STDERR "Reading XML Part 5 6,7 and 8 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-06.xml > "$xml_temp"mappedfile-06.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-07.xml > "$xml_temp"mappedfile-07.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-08.xml > "$xml_temp"mappedfile-08.xml};
    }
    elsif ( -e "$xml_temp/workfile-07.xml")
    {
        print STDERR "Reading XML Part 5, 6 and 7 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-06.xml > "$xml_temp"mappedfile-06.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-07.xml > "$xml_temp"mappedfile-07.xml};
            }
            elsif ( -e "$xml_temp/workfile-06.xml")
            {
                print STDERR "Reading XML Part 5 and 6 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-06.xml > "$xml_temp"mappedfile-06.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-05.xml")
                     {
                        print STDERR "Reading XML Part 5\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-05.xml > "$xml_temp"mappedfile-05.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-12.xml")
{
    print STDERR "Reading XML Part 9 10,11 and 12 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-10.xml > "$xml_temp"mappedfile-10.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-11.xml > "$xml_temp"mappedfile-11.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-12.xml > "$xml_temp"mappedfile-12.xml};
    }
    elsif ( -e "$xml_temp/workfile-11.xml")
    {
        print STDERR "Reading XML Part 9, 10 and 11 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-10.xml > "$xml_temp"mappedfile-10.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-11.xml > "$xml_temp"mappedfile-11.xml};
            }
            elsif ( -e "$xml_temp/workfile-10.xml")
            {
                print STDERR "Reading XML Part 09 and 10 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-10.xml > "$xml_temp"mappedfile-10.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-09.xml")
                     {
                        print STDERR "Reading XML Part 9\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-09.xml > "$xml_temp"mappedfile-09.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-16.xml")
{
    print STDERR "Reading XML Part 13 14,15 and 16 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-13.xml > "$xml_temp"mappedfile-13.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-14.xml > "$xml_temp"mappedfile-14.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-15.xml > "$xml_temp"mappedfile-15.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-16.xml > "$xml_temp"mappedfile-16.xml};
    }
    elsif ( -e "$xml_temp/workfile-15.xml")
    {
        print STDERR "Reading XML Part 13, 14 and 15 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-13.xml > "$xml_temp"mappedfile-13.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-14.xml > "$xml_temp"mappedfile-14.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-15.xml > "$xml_temp"mappedfile-15.xml};
            }
            elsif ( -e "$xml_temp/workfile-14.xml")
            {
                print STDERR "Reading XML Part 13 and 14 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-13.xml > "$xml_temp"mappedfile-13.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-14.xml > "$xml_temp"mappedfile-14.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-13.xml")
                     {
                        print STDERR "Reading XML Part 13\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-13.xml > "$xml_temp"mappedfile-13.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-20.xml")
{
    print STDERR "Reading XML Part 17 18,19 and 20 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-17.xml > "$xml_temp"mappedfile-17.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-18.xml > "$xml_temp"mappedfile-18.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-19.xml > "$xml_temp"mappedfile-19.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-20.xml > "$xml_temp"mappedfile-20.xml};
    }
    elsif ( -e "$xml_temp/workfile-19.xml")
    {
        print STDERR "Reading XML Part 17, 18 and 19 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-17.xml > "$xml_temp"mappedfile-17.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-18.xml > "$xml_temp"mappedfile-18.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-19.xml > "$xml_temp"mappedfile-19.xml};
            }
            elsif ( -e "$xml_temp/workfile-18.xml")
            {
                print STDERR "Reading XML Part 17 and 18 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-17.xml > "$xml_temp"mappedfile-17.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-18.xml > "$xml_temp"mappedfile-18.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-17.xml")
                     {
                        print STDERR "Reading XML Part 17\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-17.xml > "$xml_temp"mappedfile-17.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-24.xml")
{
    print STDERR "Reading XML Part 21 22,23 and 24 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-21.xml > "$xml_temp"mappedfile-21.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-22.xml > "$xml_temp"mappedfile-22.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-23.xml > "$xml_temp"mappedfile-23.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-24.xml > "$xml_temp"mappedfile-24.xml};
    }
    elsif ( -e "$xml_temp/workfile-23.xml")
    {
        print STDERR "Reading XML Part 21, 22 and 23 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-21.xml > "$xml_temp"mappedfile-21.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-22.xml > "$xml_temp"mappedfile-22.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-23.xml > "$xml_temp"mappedfile-23.xml};
            }
            elsif ( -e "$xml_temp/workfile-22.xml")
            {
                print STDERR "Reading XML Part 21 and 22 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-21.xml > "$xml_temp"mappedfile-21.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-22.xml > "$xml_temp"mappedfile-22.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-21.xml")
                     {
                        print STDERR "Reading XML Part 21\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-21.xml > "$xml_temp"mappedfile-21.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-28.xml")
{
    print STDERR "Reading XML Part 25 26,27 and 28 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-27.xml > "$xml_temp"mappedfile-27.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-28.xml > "$xml_temp"mappedfile-28.xml};
    }
    elsif ( -e "$xml_temp/workfile-27.xml")
    {
        print STDERR "Reading XML Part 25, 26 and 27 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-27.xml > "$xml_temp"mappedfile-27.xml};
            }
            elsif ( -e "$xml_temp/workfile-26.xml")
            {
                print STDERR "Reading XML Part 25 and 26 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-25.xml")
                     {
                        print STDERR "Reading XML Part 25\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

if ( -e "$xml_temp/workfile-32.xml")
{
    print STDERR "Reading XML Part 29 30,31 and 32 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-31.xml > "$xml_temp"mappedfile-31.xml & "$path/imdbtask_4.pl" "$xml_temp"workfile-32.xml > "$xml_temp"mappedfile-32.xml};
    }
    elsif ( -e "$xml_temp/workfile-31.xml")
    {
        print STDERR "Reading XML Part 29, 30 and 31 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml & "$path/imdbtask_3.pl" "$xml_temp"workfile-31.xml > "$xml_temp"mappedfile-31.xml};
            }
            elsif ( -e "$xml_temp/workfile-30.xml")
            {
                print STDERR "Reading XML Part 29 and 30 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_2.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml};     
                    }  
                    elsif ( -e "$xml_temp/workfile-29.xml")
                     {
                        print STDERR "Reading XML Part 29\n";
                        qx{"$path/imdbtask_1.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml};     
                            } 

wait;
if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax}; 
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }
    $thread = qx{ps ax};
    if ($thread=~ m/imdbtask/) 
{
    print STDERR "Waiting for Threads to finish\n";
    qx{sleep 180};
    }

print STDERR "Merging Splitted XML Files together\n";
qx{xml_merge -o $xmlout "$xml_temp"mappedfile-00.xml};

wait;

print STDERR "Deleting Workfiles\n";
qx{rm -rf "$xml_temp"};
1;


