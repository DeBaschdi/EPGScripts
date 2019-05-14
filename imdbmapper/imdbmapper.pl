#!/usr/bin/perl -w

use utf8;
use strict;
use warnings;
use Data::Dumper;
use XML::DOM;
use Term::ANSIColor;



binmode (STDERR,"encoding(utf8)");

#####################################
## ImdbMapper                      ##
## Revision 7 20190514             ##
## takealug.de                     ##
## https://github.com/sunsettrack4 ##
#####################################

#Path to php helper-scripts i.E Path to "age.php"
my $path= "/home/takealug/EPG/takealug/imdbmapper" ;                                  

# Max Cachetime in Days
my $cachetime = 5; 


#Check if path to Helperscripts exist

if (-e "$path/age.php" && -e "$path/country.php"  && -e "$path/imdb.class.php"  && -e "$path/poster.php"  && -e "$path/rating.php"  && -e "$path/url.php"  && -e "$path/year.php"  )
{
    print STDERR color("green"), "Helperscripts Found OK\n", color("reset");
} else {
    die color("red"), "Can´t open one or more php Helperscripts in Folder $path, please check Line 22 in imdbmapper.pl\n $!" , color("reset") ;
} 

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
  print STDERR "\nArg=$num_args Usage: <script> <xmlfile>\n";
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
my $parser=new XML::DOM::Parser;
print STDERR "Reading XML file\n";

my $doc=$parser->parsefile($xmlfile) or die$!;
print STDERR "Starting Pass 1, IMDB Search for Movies and Series\n";

my $root=$doc->getDocumentElement();

#use all elements in programme-string
my @program=$root->getElementsByTagName("programme");                                


foreach my $program(@program) {
  
#parse xml tagged with #title string
  my $TitleElement=$program->getElementsByTagName("title")->item(0);                 
  my $SearchImdbForTitle;
  $SearchImdbForTitle=$TitleElement->getFirstChild()->getData();
  
  my $CategoryElement1von3=$program->getElementsByTagName("category")->item(0);      #parse xml for the first category string
    if (not defined $CategoryElement1von3) {                                         #if category string is missing, add a dummy
      $CategoryElement1von3=$doc->createElement('category');
      my $textElement=$doc->createTextNode('Keine Informationen Enthalten'); 
      $CategoryElement1von3->appendChild($textElement);
      $CategoryElement1von3->setAttribute('lang',"de");
      $program->appendChild($CategoryElement1von3);}
  my $CategoryElement1;
  $CategoryElement1=$CategoryElement1von3->getFirstChild()->getData();
  
  my $CategoryElement2von3=$program->getElementsByTagName("category")->item(1);      #parse xml for the second category string
   if (not defined $CategoryElement2von3) {                                          #if category string is missing, add a dummy
      $CategoryElement2von3=$doc->createElement('category');
      my $textElement=$doc->createTextNode('dummy');
      $CategoryElement2von3->appendChild($textElement);
      $program->appendChild($CategoryElement2von3);}
  my $CategoryElement2;
  $CategoryElement2=$CategoryElement2von3->getFirstChild()->getData();
  
  my $CategoryElement3von3=$program->getElementsByTagName("category")->item(2);      #parse xml for the third category string
   if (not defined $CategoryElement3von3) {                                          #if category string is missing, add a dummy
      $CategoryElement3von3=$doc->createElement('category');
      my $textElement=$doc->createTextNode('dummy');
      $CategoryElement3von3->appendChild($textElement);
      $program->appendChild($CategoryElement3von3);}
  my $CategoryElement3;
  $CategoryElement3=$CategoryElement3von3->getFirstChild()->getData();
  
  my $categoryFILTER1von3 ="";
      if  ($CategoryElement1 eq 'News / Current affairs' ||                          $CategoryElement1 eq 'News / Weather report' || 
           $CategoryElement1 eq 'News magazine' ||                                   $CategoryElement1 eq 'Documentary' || 
           $CategoryElement1 eq 'Discussion / Interview / Debate' ||                 $CategoryElement1 eq 'Show / Game show' || 
           $CategoryElement1 eq 'Game show / Quiz / Contest' ||                      $CategoryElement1 eq 'Variety show' || 
           $CategoryElement1 eq 'Talk show' ||                                       $CategoryElement1 eq 'Sports' || 
           $CategoryElement1 eq 'Special events (Olympic Games, World Cup, etc.)' || $CategoryElement1 eq 'Sports magazines' ||
           $CategoryElement1 eq 'Football / Soccer' ||                               $CategoryElement1 eq 'Tennis / Squash' || 
           $CategoryElement1 eq 'Team sports (excluding football)' ||                $CategoryElement1 eq 'Athletics' ||
           $CategoryElement1 eq 'Motor sport' ||                                     $CategoryElement1 eq 'Water sport' || 
           $CategoryElement1 eq 'Winter sports' ||                                   $CategoryElement1 eq 'Equestrian' ||
           $CategoryElement1 eq 'Children\'s / Youth programs' ||                    $CategoryElement1 eq 'Pre-school children\'s programs' || 
           $CategoryElement1 eq 'Entertainment programs for 6 to 14' ||              $CategoryElement1 eq 'Entertainment programs for 10 to 16' ||
           $CategoryElement1 eq 'Cartoons / Puppets' ||                              $CategoryElement1 eq 'Adult movie / Drama' ||
           $CategoryElement1 eq 'Martial Sports' ||                                  $CategoryElement1 eq 'Informational / Educational / School programs' ||
           $CategoryElement1 eq 'Music / Ballet / Dance' ||                          $CategoryElement1 eq 'Rock / Pop' || 
           $CategoryElement1 eq 'Serious music / Classical music' ||                 $CategoryElement1 eq 'Folk / Traditional music' || 
           $CategoryElement1 eq 'Jazz' ||                                            $CategoryElement1 eq 'Musical / Opera' || 
           $CategoryElement1 eq 'Arts / Culture (without music)' ||                  $CategoryElement1 eq 'Performing arts' || 
           $CategoryElement1 eq 'Fine arts' ||                                       $CategoryElement1 eq 'Religion' || 
           $CategoryElement1 eq 'Popular culture / Traditional arts' ||              $CategoryElement1 eq 'Literature' || 
           $CategoryElement1 eq 'Broadcasting / Press' ||                            $CategoryElement1 eq 'Social / Political issues / Economics' || 
           $CategoryElement1 eq 'Magazines / Reports / Documentary' ||               $CategoryElement1 eq 'Economics / Social advisory' || 
           $CategoryElement1 eq 'Remarkable people' ||                               $CategoryElement1 eq 'Education / Science / Factual topics' || 
           $CategoryElement1 eq 'Nature / Animals / Environment' ||                  $CategoryElement1 eq 'Technology / Natural sciences' || 
           $CategoryElement1 eq 'Medicine / Physiology / Psychology' ||              $CategoryElement1 eq 'Foreign countries / Expeditions' || 
           $CategoryElement1 eq 'Social / Spiritual sciences' ||                     $CategoryElement1 eq 'Further education' || 
           $CategoryElement1 eq 'Languages' ||                                       $CategoryElement1 eq 'Leisure hobbies' || 
           $CategoryElement1 eq 'Tourism / Travel' ||                                $CategoryElement1 eq 'Handicraft' || 
           $CategoryElement1 eq 'Motoring' ||                                        $CategoryElement1 eq 'Fitness and health' || 
           $CategoryElement1 eq 'Cooking' ||                                         $CategoryElement1 eq 'Advertisement / Shopping' || 
           $CategoryElement1 eq 'Gardening' ||                                       $CategoryElement1 eq 'Fashion' || 
           $CategoryElement1 eq 'Keine Informationen Enthalten' ||                   $CategoryElement1 eq 'Serious / Classical / Religious / Historical movie / Drama' ||
           $CategoryElement1 eq 'Live Broadcast')                                    
       {
        $categoryFILTER1von3 = "skipped";
       } else {
        $categoryFILTER1von3 = "used";
        }   
  
  my $categoryFILTER2von3 ="";
      if  ($CategoryElement2 eq 'News / Current affairs' ||                          $CategoryElement2 eq 'News / Weather report' || 
           $CategoryElement2 eq 'News magazine' ||                                   $CategoryElement2 eq 'Documentary' || 
           $CategoryElement2 eq 'Discussion / Interview / Debate' ||                 $CategoryElement2 eq 'Show / Game show' || 
           $CategoryElement2 eq 'Game show / Quiz / Contest' ||                      $CategoryElement2 eq 'Variety show' || 
           $CategoryElement2 eq 'Talk show' ||                                       $CategoryElement2 eq 'Sports' || 
           $CategoryElement2 eq 'Special events (Olympic Games, World Cup, etc.)' || $CategoryElement2 eq 'Sports magazines' ||
           $CategoryElement2 eq 'Football / Soccer' ||                               $CategoryElement2 eq 'Tennis / Squash' || 
           $CategoryElement2 eq 'Team sports (excluding football)' ||                $CategoryElement2 eq 'Athletics' ||
           $CategoryElement2 eq 'Motor sport' ||                                     $CategoryElement2 eq 'Water sport' || 
           $CategoryElement2 eq 'Winter sports' ||                                   $CategoryElement2 eq 'Equestrian' || 
           $CategoryElement2 eq 'Children\'s / Youth programs' ||                    $CategoryElement2 eq 'Pre-school children\'s programs' || 
           $CategoryElement2 eq 'Entertainment programs for 6 to 14' ||              $CategoryElement2 eq 'Entertainment programs for 10 to 16' ||
           $CategoryElement2 eq 'Cartoons / Puppets' ||                              $CategoryElement2 eq 'Adult movie / Drama' ||
           $CategoryElement2 eq 'Martial Sports' ||                                  $CategoryElement2 eq 'Informational / Educational / School programs' ||
           $CategoryElement2 eq 'Music / Ballet / Dance' ||                          $CategoryElement2 eq 'Rock / Pop' || 
           $CategoryElement2 eq 'Serious music / Classical music' ||                 $CategoryElement2 eq 'Folk / Traditional music' || 
           $CategoryElement2 eq 'Jazz' ||                                            $CategoryElement2 eq 'Musical / Opera' || 
           $CategoryElement2 eq 'Arts / Culture (without music)' ||                  $CategoryElement2 eq 'Performing arts' || 
           $CategoryElement2 eq 'Fine arts' ||                                       $CategoryElement2 eq 'Religion' || 
           $CategoryElement2 eq 'Popular culture / Traditional arts' ||              $CategoryElement2 eq 'Literature' || 
           $CategoryElement2 eq 'Broadcasting / Press' ||                            $CategoryElement2 eq 'Social / Political issues / Economics' || 
           $CategoryElement2 eq 'Magazines / Reports / Documentary' ||               $CategoryElement2 eq 'Economics / Social advisory' || 
           $CategoryElement2 eq 'Remarkable people' ||                               $CategoryElement2 eq 'Education / Science / Factual topics' || 
           $CategoryElement2 eq 'Nature / Animals / Environment' ||                  $CategoryElement2 eq 'Technology / Natural sciences' || 
           $CategoryElement2 eq 'Medicine / Physiology / Psychology' ||              $CategoryElement2 eq 'Foreign countries / Expeditions' || 
           $CategoryElement2 eq 'Social / Spiritual sciences' ||                     $CategoryElement2 eq 'Further education' || 
           $CategoryElement2 eq 'Languages' ||                                       $CategoryElement2 eq 'Leisure hobbies' || 
           $CategoryElement2 eq 'Tourism / Travel' ||                                $CategoryElement2 eq 'Handicraft' || 
           $CategoryElement2 eq 'Motoring' ||                                        $CategoryElement2 eq 'Fitness and health' || 
           $CategoryElement2 eq 'Cooking' ||                                         $CategoryElement2 eq 'Advertisement / Shopping' || 
           $CategoryElement2 eq 'Gardening' ||                                       $CategoryElement2 eq 'Fashion' || 
           $CategoryElement2 eq 'Keine Informationen Enthalten' ||                   $CategoryElement2 eq 'Serious / Classical / Religious / Historical movie / Drama' ||
           $CategoryElement2 eq 'Live Broadcast')
       {
        $categoryFILTER2von3 = "skipped";
       } else {
        $categoryFILTER2von3 = "used";
        }   
  
  my $categoryFILTER3von3 ="";
      if  ($CategoryElement3 eq 'News / Current affairs' ||                          $CategoryElement3 eq 'News / Weather report' || 
           $CategoryElement3 eq 'News magazine' ||                                   $CategoryElement3 eq 'Documentary' || 
           $CategoryElement3 eq 'Discussion / Interview / Debate' ||                 $CategoryElement3 eq 'Show / Game show' || 
           $CategoryElement3 eq 'Game show / Quiz / Contest' ||                      $CategoryElement3 eq 'Variety show' || 
           $CategoryElement3 eq 'Talk show' ||                                       $CategoryElement3 eq 'Sports' || 
           $CategoryElement3 eq 'Special events (Olympic Games, World Cup, etc.)' || $CategoryElement3 eq 'Sports magazines' ||
           $CategoryElement3 eq 'Football / Soccer' ||                               $CategoryElement3 eq 'Tennis / Squash' || 
           $CategoryElement3 eq 'Team sports (excluding football)' ||                $CategoryElement3 eq 'Athletics' ||
           $CategoryElement3 eq 'Motor sport' ||                                     $CategoryElement3 eq 'Water sport' || 
           $CategoryElement3 eq 'Winter sports' ||                                   $CategoryElement3 eq 'Equestrian' || 
           $CategoryElement3 eq 'Children\'s / Youth programs' ||                    $CategoryElement3 eq 'Pre-school children\'s programs' || 
           $CategoryElement3 eq 'Entertainment programs for 6 to 14' ||              $CategoryElement3 eq 'Entertainment programs for 10 to 16' ||
           $CategoryElement3 eq 'Cartoons / Puppets' ||                              $CategoryElement3 eq 'Adult movie / Drama' ||
           $CategoryElement3 eq 'Martial Sports' ||                                  $CategoryElement3 eq 'Informational / Educational / School programs' ||
           $CategoryElement3 eq 'Music / Ballet / Dance' ||                          $CategoryElement3 eq 'Rock / Pop' || 
           $CategoryElement3 eq 'Serious music / Classical music' ||                 $CategoryElement3 eq 'Folk / Traditional music' || 
           $CategoryElement3 eq 'Jazz' ||                                            $CategoryElement3 eq 'Musical / Opera' || 
           $CategoryElement3 eq 'Arts / Culture (without music)' ||                  $CategoryElement3 eq 'Performing arts' || 
           $CategoryElement3 eq 'Fine arts' ||                                       $CategoryElement3 eq 'Religion' || 
           $CategoryElement3 eq 'Popular culture / Traditional arts' ||              $CategoryElement3 eq 'Literature' || 
           $CategoryElement3 eq 'Broadcasting / Press' ||                            $CategoryElement3 eq 'Social / Political issues / Economics' || 
           $CategoryElement3 eq 'Magazines / Reports / Documentary' ||               $CategoryElement3 eq 'Economics / Social advisory' || 
           $CategoryElement3 eq 'Remarkable people' ||                               $CategoryElement3 eq 'Education / Science / Factual topics' || 
           $CategoryElement3 eq 'Nature / Animals / Environment' ||                  $CategoryElement3 eq 'Technology / Natural sciences' || 
           $CategoryElement3 eq 'Medicine / Physiology / Psychology' ||              $CategoryElement3 eq 'Foreign countries / Expeditions' || 
           $CategoryElement3 eq 'Social / Spiritual sciences' ||                     $CategoryElement3 eq 'Further education' || 
           $CategoryElement3 eq 'Languages' ||                                       $CategoryElement3 eq 'Leisure hobbies' || 
           $CategoryElement3 eq 'Tourism / Travel' ||                                $CategoryElement3 eq 'Handicraft' || 
           $CategoryElement3 eq 'Motoring' ||                                        $CategoryElement3 eq 'Fitness and health' || 
           $CategoryElement3 eq 'Cooking' ||                                         $CategoryElement3 eq 'Advertisement / Shopping' || 
           $CategoryElement3 eq 'Gardening' ||                                       $CategoryElement3 eq 'Fashion' || 
           $CategoryElement3 eq 'Keine Informationen Enthalten' ||                   $CategoryElement3 eq 'Serious / Classical / Religious / Historical movie / Drama' ||
           $CategoryElement3 eq 'Live Broadcast')
       {
        $categoryFILTER3von3 = "skipped";
       } else {
        $categoryFILTER3von3 = "used";
        }   
  
  my $categoryFILTER ="";
        if  ($categoryFILTER1von3 eq 'skipped' || $categoryFILTER2von3 eq 'skipped' || $categoryFILTER3von3 eq 'skipped') 
        {
        $categoryFILTER = "skipped";
       } else {
        $categoryFILTER = "used";
        } 
  
  my $imdbRATING ="";
  if ($categoryFILTER eq 'used') 
     {
     $imdbRATING = qx{php "$path/rating.php"   "$SearchImdbForTitle;"};
     } else {
     $imdbRATING = 'nomatch' }
  
  my $imdbAGE ="";
  if ($categoryFILTER eq 'used') 
     { 
     $imdbAGE         = qx{php "$path/age.php"      "$SearchImdbForTitle;"};
     } else {
     $imdbAGE = 'nomatch' }
     
     
  my $imdbPOSTER ="";
  if ($categoryFILTER eq 'used') 
     { 
     $imdbPOSTER         = qx{php "$path/poster.php"      "$SearchImdbForTitle;"};
     } else {
     $imdbPOSTER = 'nomatch' }   
     
  my $imdbCOUNTRY ="";
  if ($categoryFILTER eq 'used') 
     { 
     $imdbCOUNTRY         = qx{php "$path/country.php"      "$SearchImdbForTitle;"};
     } else {
     $imdbCOUNTRY = 'nomatch' }   
     
   my $imdbYEAR ="";
   if ($categoryFILTER eq 'used') 
     { 
     $imdbYEAR         = qx{php "$path/year.php"      "$SearchImdbForTitle;"};
     } else {
     $imdbYEAR = 'nomatch' }
     
   my $imdbURL  ="";
   if ($categoryFILTER eq 'used') 
     { 
     $imdbURL          = qx{php "$path/url.php"      "$SearchImdbForTitle;"};
     } else {
     $imdbURL  = 'nomatch' }  
     
#change , in .                                                                                                                   
  $imdbRATING =~ tr/,/./;                                                                                         

#Matchfilter for Rating  
  my $imdbMatchRATING = "";                             
      if ($imdbRATING eq 'nomatch' || $imdbRATING eq 'n/A/10' || $imdbRATING eq '/10' || $imdbRATING eq '')       
       {
        $imdbMatchRATING = "nomatch";
       } else {
        $imdbMatchRATING = "match";
        }   

#Matchfilter for Age-Rating
  my $imdbMatchAGE = "";
      if ($imdbAGE eq 'nomatch' || $imdbAGE eq 'n/A' || $imdbAGE eq '' )                                           
       {
        $imdbMatchAGE = "nomatch";
       } else {
        $imdbMatchAGE = "match";
        }
  
#Matchfilter for Images
  my $imdbMatchPOSTER = "";
      if ($imdbPOSTER eq 'nomatch' || $imdbPOSTER eq 'n/A' || $imdbPOSTER eq '' || $imdbPOSTER eq 'https://m.media-amazon.com/images/G/01/imdb/images-ANDW73HA/imdb_fb_logo._CB1542065250_.png')           
       {
        $imdbMatchPOSTER = "nomatch";
       } else {
        $imdbMatchPOSTER = "match";
        }   

#Matchfilter for Country        
  my $imdbMatchCOUNTRY = "";                                                        
      if ($imdbCOUNTRY eq 'nomatch' || $imdbCOUNTRY eq 'n/A' || $imdbCOUNTRY eq '')                                 
       {
        $imdbMatchCOUNTRY = "nomatch";
       } else {
        $imdbMatchCOUNTRY = "match";
        }

#Matchfilter for Date        
  my $imdbMatchYEAR = "";
      if ($imdbYEAR eq 'nomatch' || $imdbYEAR eq 'n/A' || $imdbYEAR eq '')                                          
       {
        $imdbMatchYEAR = "nomatch";
       } else {
        $imdbMatchYEAR = "match";
        } 

#Matchfilter for IMDb URL  
  my $imdbMatchURL = "";
      if ($imdbURL eq 'nomatch' || $imdbURL eq 'n/A' || $imdbURL eq '')                                            
       {
        $imdbMatchURL = "nomatch";
       } else {
        $imdbMatchURL = "match";
        }      
 
  my $imdbMatch = "";
      if ($imdbMatchRATING eq 'match' || $imdbMatchAGE eq 'match' || $imdbMatchPOSTER eq 'match' || $imdbMatchCOUNTRY eq 'match' || $imdbMatchYEAR eq 'match' || $imdbMatchURL eq 'match')  
       {
        $imdbMatch =  "match";
       } else {
        $imdbMatch = "nomatch";
        }
        
  my $CountryElement=$program->getElementsByTagName("country")->item(0);                                            #parse xml tagged with #county string
   if ($categoryFILTER eq 'used' && $imdbMatchCOUNTRY eq 'match' && not defined $CountryElement) {                  #add country string if not alredy exist
      $CountryElement=$doc->createElement('country');
      my $textElement=$doc->createTextNode($imdbCOUNTRY);
      $CountryElement->appendChild($textElement);
      $CountryElement->setAttribute('lang',"de");
      $program->appendChild($CountryElement);
      }
      
  
  my $DateElement=$program->getElementsByTagName("date")->item(0);                                                  #parse xml tagged with #date string
    if ($categoryFILTER eq 'used' && $imdbMatchYEAR eq 'match' && not defined $DateElement) {                       #add date string if not alredy exist
      $DateElement=$doc->createElement('date');
      my $textElement=$doc->createTextNode($imdbYEAR);
      $DateElement->appendChild($textElement);
      $program->appendChild($DateElement);
      } 
 
 my $RatingElement=$program->getElementsByTagName("rating")->item(0);                                               #parse xml tagged with #rating string
    if ($categoryFILTER eq 'used' && $imdbMatchAGE eq 'match' && not defined $RatingElement) {                      #add rating string if not alredy exist
      $RatingElement=$doc->createElement('rating');
      my $RatingValueElement=$doc->createElement('value');                     
      my $textElement=$doc->createTextNode($imdbAGE);
      $RatingValueElement->appendChild($textElement);
      $RatingElement->appendChild($RatingValueElement);
      $RatingElement->setAttribute('system',"FSK");
      $program->appendChild($RatingElement);
      } 

 my $StarRatingElement=$program->getElementsByTagName("star-rating")->item(0);                                       #parse xml tagged with #star-rating string
    if ($categoryFILTER eq 'used' && $imdbMatchRATING eq 'match' && not defined $StarRatingElement) {               #add star-rating string if not alredy exist
      $StarRatingElement=$doc->createElement('star-rating');
      my $StarRatingValueElement=$doc->createElement('value');
      my $textElement=$doc->createTextNode($imdbRATING);
      $StarRatingValueElement->appendChild($textElement);
      $StarRatingElement->appendChild($StarRatingValueElement);
      $StarRatingElement->setAttribute('system',"IMDb");
      $program->appendChild($StarRatingElement);
      } 


 my $IconElement=$program->getElementsByTagName("icon")->item(0);                                                    #parse xml tagged with #icon string
    if ($categoryFILTER eq 'used' && $imdbMatchPOSTER eq 'match'){                                                  #add icon string if not alredy exist
    if (defined $IconElement) {  $program->removeChild($IconElement)};
      $IconElement=$doc->createElement('icon');
      $IconElement->setAttribute('src',"$imdbPOSTER");
      $program->appendChild($IconElement);
      }       
      
      
 my $ImdbElement=$program->getElementsByTagName("imdb")->item(0);                                                    #parse xml tagged with #icon string
    if ($categoryFILTER eq 'used' && $imdbMatchURL eq 'match' && not defined $ImdbElement) {                         #add icon string if not alredy exist
      $ImdbElement=$doc->createElement('imdb');
      $ImdbElement->setAttribute('url',"$imdbURL");
      $program->appendChild($ImdbElement);
      }

 if ($CategoryElement2von3->hasChildNodes() && $CategoryElement2 eq 'dummy') {                                       #Remove dummy category 2/3
      $program->removeChild($CategoryElement2von3);
      }
 
 if ($CategoryElement3von3->hasChildNodes() && $CategoryElement3 eq 'dummy') {                                       #Remove dummy category 3/3
      $program->removeChild($CategoryElement3von3);
      }
    

if ("$categoryFILTER $imdbMatch" eq 'used match'){    
print STDERR color("green"),  "$categoryFILTER $imdbMatch", color("reset"); print STDERR " for Movie $SearchImdbForTitle\n";}
else {print STDERR color("red"),  "$categoryFILTER $imdbMatch", color("reset"); print STDERR " for Movie $SearchImdbForTitle\n";}

}

print STDERR "IMDB Search in Pass 1 complete\n";





my $tempfile="/tmp/xmltv.xml_temp";
$doc->printToFile($tempfile);
$doc->dispose;

open(my $FN, '<', $tempfile) or die "unable to open file, $!";
while (<$FN>) {
   my $line = $_ ;
   $line =~ s/></>\n  </g ;
   next if /^\s*$/;
print $line;
} 

close($FN);
unlink $tempfile;
1;
