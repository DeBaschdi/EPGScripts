#!/usr/bin/perl -w 
## Ratingmapper ##
## Revision 3 20190228 ##
## takealug.de
## github.com/sunsettrack4 ##

use strict;
use warnings;
use Data::Dumper;
use XML::DOM;

## Hier werden Die Sterne Aufgeführt und definiert##
my $star0             =    "☆☆☆☆☆";
my $star1             =    "★☆☆☆☆";
my $star2             =    "★★☆☆☆";
my $star3             =    "★★★☆☆";
my $star4             =    "★★★★☆";
my $star5             =    "★★★★★";
my %ADDSTARRATING=(

###AB Hier solln die gegrabten ratings z.b 4.2/10 mit ★★☆☆☆ versehen werden###
 "0.0"  => $star0 ,            
 "0.1"  => $star0 ,
 "0.2"  => $star0 ,
 "0.3"  => $star0 , 
 "0.4"  => $star0 , 
 "0.5"  => $star0 , 
 "0.6"  => $star0 , 
 "0.7"  => $star0 , 
 "0.8"  => $star0 , 
 "0.9"  => $star0 , 
 "1"    => $star1 ,            
 "1.0"  => $star1 , 
 "1.1"  => $star1 ,
 "1.2"  => $star1 ,
 "1.3"  => $star1 , 
 "1.4"  => $star1 , 
 "1.5"  => $star1 , 
 "1.6"  => $star1 , 
 "1.7"  => $star1 , 
 "1.8"  => $star1 , 
 "1.9"  => $star1 , 
 "2"    => $star1 ,
 "2.0"  => $star1 ,
 "2.1"  => $star1 ,
 "2.2"  => $star1 ,
 "2.3"  => $star1 , 
 "2.4"  => $star1 , 
 "2.5"  => $star1 , 
 "2.6"  => $star1 , 
 "2.7"  => $star1 , 
 "2.8"  => $star1 , 
 "2.9"  => $star1 , 
 "3"    => $star2 ,            
 "3.0"  => $star2 ,
 "3.1"  => $star2 ,
 "3.2"  => $star2 ,
 "3.3"  => $star2 , 
 "3.4"  => $star2 , 
 "3.5"  => $star2 , 
 "3.6"  => $star2 , 
 "3.7"  => $star2 , 
 "3.8"  => $star2 , 
 "3.9"  => $star2 , 
 "4"    => $star2 ,
 "4.0"  => $star2 ,            
 "4.1"  => $star2 ,
 "4.2"  => $star2 ,
 "4.3"  => $star2 , 
 "4.4"  => $star2 , 
 "4.5"  => $star2 , 
 "4.6"  => $star2 , 
 "4.7"  => $star2 , 
 "4.8"  => $star2 , 
 "4.9"  => $star2 , 
 "5"    => $star3 , 
 "5.0"  => $star3 ,
 "5.1"  => $star3 ,
 "5.2"  => $star3 ,
 "5.3"  => $star3 , 
 "5.4"  => $star3 , 
 "5.5"  => $star3 , 
 "5.6"  => $star3 , 
 "5.7"  => $star3 , 
 "5.8"  => $star3 , 
 "5.9"  => $star3 , 
 "6"    => $star3 ,    
 "6.0"  => $star3 ,
 "6.1"  => $star3 ,
 "6.2"  => $star3 ,
 "6.3"  => $star3 , 
 "6.4"  => $star3 , 
 "6.5"  => $star3 , 
 "6.6"  => $star3 , 
 "6.7"  => $star3 , 
 "6.8"  => $star3 , 
 "6.9"  => $star3 , 
 "7"    => $star4 , 
 "7.0"  => $star4 ,            
 "7.1"  => $star4 ,
 "7.2"  => $star4 ,
 "7.3"  => $star4 , 
 "7.4"  => $star4 , 
 "7.5"  => $star4 , 
 "7.6"  => $star4 , 
 "7.7"  => $star4 , 
 "7.8"  => $star4 , 
 "7.9"  => $star4 , 
 "8"    => $star4 , 
 "8.0"  => $star4 ,            
 "8.1"  => $star4 ,
 "8.2"  => $star4 ,
 "8.3"  => $star4 , 
 "8.4"  => $star4 , 
 "8.5"  => $star4 , 
 "8.6"  => $star4 , 
 "8.7"  => $star4 , 
 "8.8"  => $star4 , 
 "8.9"  => $star4 , 
 "9"    => $star5 , 
 "9.0"  => $star5 ,            
 "9.1"  => $star5 ,
 "9.2"  => $star5 ,
 "9.3"  => $star5 , 
 "9.4"  => $star5 , 
 "9.5"  => $star5 , 
 "9.6"  => $star5 , 
 "9.7"  => $star5 , 
 "9.8"  => $star5 , 
 "9.9"  => $star5 , 
 "10"   => $star5 , 
 "10.0" => $star5 ,
  ) ; 

  
my $PRE  = 'VALUE_' ;
my $POST = '/10_END'  ;
my $PRE2 = '2ndVALUE_' ;
my $POST2 = '/10_2ndEND' ;

sub myfilter {
  my ($a) = @_;
  if ( exists $ADDSTARRATING{$a} ) {     
      return $ADDSTARRATING{$a} ;
  } else {
      print STDERR "Warning: Unmanaged stars: '$a'\n" ;
      return $a ;
  }
}

# read the xml file and update the info
my $num_args = $#ARGV + 1;
if ($num_args != 1) {
  print STDERR "\nArg=$num_args Usage: <script> <xmlfile>\n";
  exit;
}

my $xmlfile=$ARGV[0];
my $parser=new XML::DOM::Parser;
print STDERR "Reading XML file\n";

my $doc=$parser->parsefile($xmlfile) or die$!;
print STDERR "Parsing Sections\n";

my $root=$doc->getDocumentElement();
my @program=$root->getElementsByTagName("programme");
foreach my $program(@program) {

  
  my $dateElement=$program->getElementsByTagName("country")->item(0); #parse xml tagged with #county string
  my $country;
  if ( defined $dateElement ) {
    $country=$dateElement->getFirstChild()->getData();
    if (length($country) == 8) {
      $country = substr($country,0,4) . "/" . substr($country,4,2) . "/" . substr($country,6,2);
    }
  }
  
  my $descadd='';
  if ( defined $country ) {
    $descadd='(' . $country . ') ';
  }
  
  my @date=$program->getElementsByTagName("date");  #parse xml tagged with #date string
  foreach my $date(@date) {
    $descadd=$descadd . $date->getFirstChild()->getData() .  ' ' ; #add space between year and value
  }
  
  my @value=$program->getElementsByTagName("value"); #parse xml tagged with #value string
  foreach my $value(@value) {
    $descadd=$descadd . 'VALUE_' . $value->getFirstChild()->getData() . '_END' . "NEXT";
  }

  
  # update the desc with stars, year, country, and age-rating
  my $descElement=$program->getElementsByTagName("desc")->item(0);
  my $desc='';
  if ( defined $descElement ) {
    $desc=$descElement->getFirstChild()->getData();
    $desc=$descadd . "\n" . $desc;
    $descElement->getFirstChild()->setNodeValue($desc);
  
  } else {
    if ( defined $descadd ) {
      # need to add a desc node
      $descElement=$doc->createElement('desc');
      my $textElement=$doc->createTextNode($descadd);
      $descElement->appendChild($textElement);
      $program->appendChild($descElement);
    }
  }
}

print STDERR "Pass 1 complete\n";

my $tempfile="/tmp/xmltv.xml_temp";
$doc->printToFile($tempfile);
$doc->dispose;
open(my $FN, '<', $tempfile) or die "unable to open file, $!";
print STDERR "Updating Stars\n";

while (<$FN>) {
    my $line = $_ ;
    # Warning $PRE contains 2 hidden level of parenthesis
    $line =~ s/_ENDNEXTVALUE/_END2ndVALUE/g ;
    $line =~ s/(.*)(2ndVALUE.*)(_ENDNEXT)/$1$2_2ndEND/g ;
    $line =~ s/_ENDNEXT/_END/g ;
    $line =~ s/($PRE)(.*)($POST)/'• IMDb: '.myfilter("$2")/ge ;
    $line =~ s/($PRE2)(.*)($POST2)/' • IMDb: '.myfilter("$2")/ge ;
    $line =~ s/VALUE_(.*)_END/• FSK $1/g ;
    $line =~ s/2ndVALUE_(.*)_2ndEND/ • FSK $1/g ;
    $line =~ s/>• />/g ;
    print $line;
} 

close($FN);
unlink $tempfile;
1;
