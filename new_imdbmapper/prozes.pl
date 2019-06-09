#!/usr/bin/perl -w

use utf8;
use strict;
use warnings;
use Term::ANSIColor;

my $path= "imdb" ;

binmode (STDERR,"encoding(utf8)");

my $thread = qx{ps ax};


sub progress_split { 
      my $thread = qx{ps ax};
      if ($thread =~ /\/usr\/bin\/xml_split/)  { 
            sleep(2);
            my $info = qx{ls $path/temp/ |grep -o workfile- |uniq -c |sed 's/[^0-9]*//g'};
            my $multiply = 2;
            my $statesplit = $info * $multiply;
            system "$path/status.sh destroy_scroll_area";
            system "$path/status.sh setup_scroll_area";
            system "$path/status.sh 'draw_progress_bar $statesplit' ";
            progress_split();
      }
}

if ($thread =~ /\/usr\/bin\/xml_split/)  { 
      progress_split();
}


sleep(1);


sub progress_imdb { 
      my $thread = qx{ps ax};
      if ($thread=~ m/imdb\/worker/)  { 
            sleep(5);
            my $info = qx{ls $path/temp/ |grep -o mappedfile- |uniq -c |sed 's/[^0-9]*//g'};
            my $multiply = 2;
            my $statemapped = $info * $multiply;
            system "$path/status.sh destroy_scroll_area";
            system "$path/status.sh setup_scroll_area";
            system "$path/status.sh 'draw_progress_bar $statemapped' ";
            progress_imdb();
      }
}

if ($thread=~ m/imdb\/worker/)  { 
      progress_imdb();
}



exit;

