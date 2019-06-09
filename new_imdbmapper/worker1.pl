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

sub wait_for_thread { 
    my $thread = qx{ps ax};
    if ($thread=~ m/imdbtask_1/ || $thread=~ m/imdbtask_2/ || $thread=~ m/imdbtask_3/ || $thread=~ m/imdbtask_4/)  { 
        sleep(4);
        wait_for_thread();
    }
}

wait;
wait_for_thread();

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
                            
wait_for_thread();

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

wait_for_thread();

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

wait_for_thread();

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

wait_for_thread();

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

wait_for_thread();
wait;


1;
exit;




