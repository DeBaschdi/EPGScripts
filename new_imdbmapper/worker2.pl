#!/usr/bin/perl -w

use utf8;
use strict;
use warnings;
use Term::ANSIColor;

binmode (STDERR,"encoding(utf8)");

my $path= "imdb" ;
my $xml_temp= "$path/temp/" ;

my $thread ="";
$thread = qx{ps ax};

if ( -e "$xml_temp/workfile-28.xml")
{
    print STDERR "Reading XML Part 25 26,27 and 28 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-27.xml > "$xml_temp"mappedfile-27.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-28.xml > "$xml_temp"mappedfile-28.xml};
    }
    elsif ( -e "$xml_temp/workfile-27.xml")
    {
        print STDERR "Reading XML Part 25, 26 and 27 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-27.xml > "$xml_temp"mappedfile-27.xml};
            }
            elsif ( -e "$xml_temp/workfile-26.xml")
            {
                print STDERR "Reading XML Part 25 and 26 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-26.xml > "$xml_temp"mappedfile-26.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-25.xml")
                     {
                        print STDERR "Reading XML Part 25\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-25.xml > "$xml_temp"mappedfile-25.xml};
                            }

sub wait_for_thread { 
    my $thread = qx{ps ax};
    if ($thread=~ m/imdbtask_5/ || $thread=~ m/imdbtask_6/ || $thread=~ m/imdbtask_7/ || $thread=~ m/imdbtask_8/)  { 
        sleep(4);
        wait_for_thread();
    }
}

wait;
wait_for_thread();

if ( -e "$xml_temp/workfile-32.xml")
{
    print STDERR "Reading XML Part 29 30,31 and 32 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-31.xml > "$xml_temp"mappedfile-31.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-32.xml > "$xml_temp"mappedfile-32.xml};
    }
    elsif ( -e "$xml_temp/workfile-31.xml")
    {
        print STDERR "Reading XML Part 29, 30 and 31 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-31.xml > "$xml_temp"mappedfile-31.xml};
            }
            elsif ( -e "$xml_temp/workfile-30.xml")
            {
                print STDERR "Reading XML Part 29 and 30 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-30.xml > "$xml_temp"mappedfile-30.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-29.xml")
                     {
                        print STDERR "Reading XML Part 29\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-29.xml > "$xml_temp"mappedfile-29.xml};
                            }


wait_for_thread();

if ( -e "$xml_temp/workfile-36.xml")
{
    print STDERR "Reading XML Part 33 34,35 and 36 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-33.xml > "$xml_temp"mappedfile-33.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-34.xml > "$xml_temp"mappedfile-34.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-35.xml > "$xml_temp"mappedfile-35.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-36.xml > "$xml_temp"mappedfile-36.xml};
    }
    elsif ( -e "$xml_temp/workfile-35.xml")
    {
        print STDERR "Reading XML Part 33, 34 and 35 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-33.xml > "$xml_temp"mappedfile-33.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-34.xml > "$xml_temp"mappedfile-34.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-35.xml > "$xml_temp"mappedfile-35.xml};
            }
            elsif ( -e "$xml_temp/workfile-34.xml")
            {
                print STDERR "Reading XML Part 33 and 34 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-33.xml > "$xml_temp"mappedfile-33.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-34.xml > "$xml_temp"mappedfile-34.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-33.xml")
                     {
                        print STDERR "Reading XML Part 33\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-33.xml > "$xml_temp"mappedfile-33.xml};
                            }


wait_for_thread();

if ( -e "$xml_temp/workfile-40.xml")
{
    print STDERR "Reading XML Part 37 38,39 and 40 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-37.xml > "$xml_temp"mappedfile-37.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-38.xml > "$xml_temp"mappedfile-38.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-39.xml > "$xml_temp"mappedfile-39.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-40.xml > "$xml_temp"mappedfile-40.xml};
    }
    elsif ( -e "$xml_temp/workfile-39.xml")
    {
        print STDERR "Reading XML Part 37, 38 and 39 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-37.xml > "$xml_temp"mappedfile-37.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-38.xml > "$xml_temp"mappedfile-38.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-39.xml > "$xml_temp"mappedfile-39.xml};
            }
            elsif ( -e "$xml_temp/workfile-38.xml")
            {
                print STDERR "Reading XML Part 37 and 38 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-37.xml > "$xml_temp"mappedfile-37.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-38.xml > "$xml_temp"mappedfile-38.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-37.xml")
                     {
                        print STDERR "Reading XML Part 37\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-37.xml > "$xml_temp"mappedfile-37.xml};
                            }


wait_for_thread();

if ( -e "$xml_temp/workfile-44.xml")
{
    print STDERR "Reading XML Part 41 42,43 and 44 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-41.xml > "$xml_temp"mappedfile-41.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-42.xml > "$xml_temp"mappedfile-42.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-43.xml > "$xml_temp"mappedfile-43.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-44.xml > "$xml_temp"mappedfile-44.xml};
    }
    elsif ( -e "$xml_temp/workfile-43.xml")
    {
        print STDERR "Reading XML Part 41, 42 and 43 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-41.xml > "$xml_temp"mappedfile-41.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-42.xml > "$xml_temp"mappedfile-42.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-43.xml > "$xml_temp"mappedfile-43.xml};
            }
            elsif ( -e "$xml_temp/workfile-42.xml")
            {
                print STDERR "Reading XML Part 41 and 42 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-41.xml > "$xml_temp"mappedfile-41.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-42.xml > "$xml_temp"mappedfile-42.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-41.xml")
                     {
                        print STDERR "Reading XML Part 41\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-41.xml > "$xml_temp"mappedfile-41.xml};
                            }


wait_for_thread();

if ( -e "$xml_temp/workfile-48.xml")
{
    print STDERR "Reading XML Part 45 46,47 and 48 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-45.xml > "$xml_temp"mappedfile-45.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-46.xml > "$xml_temp"mappedfile-46.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-47.xml > "$xml_temp"mappedfile-47.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-48.xml > "$xml_temp"mappedfile-48.xml};
    }
    elsif ( -e "$xml_temp/workfile-47.xml")
    {
        print STDERR "Reading XML Part 45, 46 and 47 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-45.xml > "$xml_temp"mappedfile-45.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-46.xml > "$xml_temp"mappedfile-46.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-47.xml > "$xml_temp"mappedfile-47.xml};
            }
            elsif ( -e "$xml_temp/workfile-46.xml")
            {
                print STDERR "Reading XML Part 45 and 46 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-45.xml > "$xml_temp"mappedfile-45.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-46.xml > "$xml_temp"mappedfile-46.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-45.xml")
                     {
                        print STDERR "Reading XML Part 45\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-45.xml > "$xml_temp"mappedfile-45.xml};
                            }


wait_for_thread();

if ( -e "$xml_temp/workfile-52.xml")
{
    print STDERR "Reading XML Part 49 50,51 and 52 Together for faster ImdB Download\n";
    qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-49.xml > "$xml_temp"mappedfile-49.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-50.xml > "$xml_temp"mappedfile-50.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-51.xml > "$xml_temp"mappedfile-51.xml & "$path/imdbtask_8.pl" "$xml_temp"workfile-52.xml > "$xml_temp"mappedfile-52.xml};
    }
    elsif ( -e "$xml_temp/workfile-51.xml")
    {
        print STDERR "Reading XML Part 49, 50 and 51 Together for faster ImdB Download\n";
        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-49.xml > "$xml_temp"mappedfile-49.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-50.xml > "$xml_temp"mappedfile-50.xml & "$path/imdbtask_7.pl" "$xml_temp"workfile-51.xml > "$xml_temp"mappedfile-51.xml};
            }
            elsif ( -e "$xml_temp/workfile-50.xml")
            {
                print STDERR "Reading XML Part 49 and 50 Together for faster ImdB Download\n";
                qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-49.xml > "$xml_temp"mappedfile-49.xml & "$path/imdbtask_6.pl" "$xml_temp"workfile-50.xml > "$xml_temp"mappedfile-50.xml};
                    }
                    elsif ( -e "$xml_temp/workfile-49.xml")
                     {
                        print STDERR "Reading XML Part 49\n";
                        qx{"$path/imdbtask_5.pl" "$xml_temp"workfile-49.xml > "$xml_temp"mappedfile-49.xml};
                            }


wait_for_thread();
wait;

1;
exit;




