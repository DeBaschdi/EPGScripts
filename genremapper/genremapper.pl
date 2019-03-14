#!/usr/bin/perl -w 

## Horizon.tv.ini genre Mapper ##
## Revision 4 ##
## DeBaschdi ##
## takealug.de ##

## Hier werden Die EIT NORM Genre Aufgeführt und definiert##
my $MOVIE             =    "Movie / Drama";
my $THRILLER          =    "Detective / Thriller";
my $ADVENTURE         =    "Adventure / Western / War";
my $SF                =    "Science fiction / Fantasy / Horror";
my $COMEDY            =    "Comedy";
my $SOAP              =    "Soap / Melodrama / Folkloric";
my $ROMANCE           =    "Romance";
my $HISTORICAL        =    "Serious / Classical / Religious / Historical movie / Drama";
my $XXX               =    "Adult movie / Drama";

my $NEWS              =    "News / Current affairs";
my $WEATHER           =    "News / Weather report";
my $NEWS_MAGAZINE     =    "News magazine";
my $DOCUMENTARY       =    "Documentary";
my $DEBATE            =    "Discussion / Interview / Debate";

my $SHOW              =    "Show / Game show";
my $GAME              =    "Game show / Quiz / Contest";
my $VARIETY           =    "Variety show";
my $TALKSHOW          =    "Talk show";

my $SPORT             =    "Sports";
my $SPORT_SPECIAL     =    "Special events (Olympic Games, World Cup, etc.)";
my $SPORT_MAGAZINE    =    "Sports magazines";
my $FOOTBALL          =    "Football / Soccer";
my $TENNIS            =    "Tennis / Squash";
my $SPORT_TEAM        =    "Team sports (excluding football)";
my $ATHLETICS         =    "Athletics";
my $SPORT_MOTOR       =    "Motor sport";
my $SPORT_WATER       =    "Water sport";
my $Winter_Sports     =    "Winter sports";
my $EQU               =    "Equestrian" ;
my $MARTIAL           =    "Martial Sports" ;

my $KIDS              =    "Children's / Youth programs";
my $KIDS_0_5          =    "Pre-school children's programs";
my $KIDS_6_14         =    "Entertainment programs for 6 to 14";
my $KIDS_10_16        =    "Entertainment programs for 10 to 16";
my $EDUCATIONAL       =    "Informational / Educational / School programs";
my $CARTOON           =    "Cartoons / Puppets";

my $MUSIC             =    "Music / Ballet / Dance";
my $ROCK_POP          =    "Rock / Pop";
my $CLASSICAL         =    "Serious music / Classical music";
my $FOLK              =    "Folk / Traditional music";
my $JAZZ              =    "Jazz";
my $OPERA             =    "Musical / Opera";

my $CULTURE           =    "Arts / Culture (without music)";
my $PERFORMING        =    "Performing arts";
my $FINE_ARTS         =    "Fine arts";
my $RELIGION          =    "Religion";
my $POPULAR_ART       =    "Popular culture / Traditional arts";
my $LITERATURE        =    "Literature";
my $FILM              =    "Film / Cinema";
my $EXPERIMENTAL_FILM =    "Experimental film / Video";
my $BROADCASTING      =    "Broadcasting / Press";


my $SOCIAL            =    "Social / Political issues / Economics";
my $MAGAZINE          =    "Magazines / Reports / Documentary";
my $ECONOMIC          =    "Economics / Social advisory";
my $VIP               =    "Remarkable people";

my $SCIENCE           =    "Education / Science / Factual topics";
my $NATURE            =    "Nature / Animals / Environment";
my $TECHNOLOGY        =    "Technology / Natural sciences";

my $MEDECINE          =    "Medicine / Physiology / Psychology";
my $FOREIGN           =    "Foreign countries / Expeditions";
my $SPIRITUAL         =    "Social / Spiritual sciences";
my $FURTHER_EDUCATION =    "Further education";
my $LANGUAGES         =    "Languages";

my $HOBBIES           =    "Leisure hobbies";
my $TRAVEL            =    "Tourism / Travel";
my $HANDICRAF         =    "Handicraft";
my $MOTORING          =    "Motoring";
my $FITNESS           =    "Fitness and health";
my $COOKING           =    "Cooking";
my $SHOPPING          =    "Advertisement / Shopping";
my $GARDENING         =    "Gardening";
my $FASHION           =    "Fashion";

my $LIVE              =    "Live Broadcast";
my $NONE              =    "Keine Informationen Enthalten";


my %REPLACE=(

###AB Hier werden die Grabber Genre/category nach unseren definierten EIT Genre gemappt###

 "Movie"  => $MOVIE ,            
 "Spielfilm"  => $MOVIE ,
 "Familienfilm" => $MOVIE ,
 "Spielfilm/Sonstige"  => $NONE , 
 "Spielfilme" => $MOVIE ,
 "Drama (film)"  => $MOVIE ,            
 "Drama (filme)"  => $MOVIE ,
 "Drama"  => $MOVIE ,            
 "Spielfilm/Drama"  => $MOVIE ,            
 "Melodrama"  => $MOVIE, 
 "Melodram"  => $MOVIE,
 "Sportfilm"  => $MOVIE,
 "Thriller"  => $THRILLER ,         
 "Agentenfilmparodie" => $THRILLER ,
 "Spielfilm/Thriller"  => $THRILLER ,        
 "Krimi"   => $THRILLER ,         
 "Serie/Krimi"   => $THRILLER ,         
 "Spielfilm/Krimi"   => $THRILLER ,        
 "Abenteuer"  => $ADVENTURE ,        
 "Abenteuerfilm" => $ADVENTURE ,
 "Spielfilm/Abenteuer"  => $ADVENTURE ,        
 "Action"  => $ADVENTURE ,        
 "Spielfilm/Action"  => $ADVENTURE ,        
 "Actionfilm"  => $ADVENTURE ,        
 "Serie/Action"  => $ADVENTURE ,        
 "Western"  => $ADVENTURE ,       
 "Spielfilm/Western" => $ADVENTURE ,        
 "Kriegsfilme" => $ADVENTURE ,        
 "Spielfilm/Kriegsfilme" => $ADVENTURE ,         
 "Sci Fi"  => $SF ,               
 "Spielfilm/Science fiction"  => $SF ,               
 "Serie/Science fiction"  => $SF ,               
 "Fantasyabenteuer" => $SF ,
 "Horror"  => $SF ,               
 "Spielfilm/Horror"  => $SF ,               
 "Spielfilm/Fantasy"  => $SF ,              
 "Fantasyfilm" => $SF ,
 "Science-Fiction-Action" => $SF ,
 "Komödie"  => $COMEDY ,           
 "Teenagerkomödie" => $COMEDY ,
 "Fantasykomödie" => $COMEDY ,
 "Familienkomödie" => $COMEDY ,
 "Tragikomödie" => $COMEDY ,
 "Spielfilm/Comedy"  => $COMEDY ,           
 "Serie/Comedy"  => $COMEDY ,           
 "Unterhaltung/Comedy" => $COMEDY , 
 "Weihnachtskomödie" => $COMEDY ,
 "Actionkomödie" => $COMEDY ,
 "Drama (serie)"  => $SOAP ,             
 "Serie/Drama"  => $SOAP , 
 "Series Drama" => $SOAP ,
 "Serie/Soap"  => $SOAP ,             
 "Theater"  => $SOAP ,            
 "Romance"  => $ROMANCE ,          
 "Serie/Romantik"  => $ROMANCE ,          
 "Spielfilm/Romantik"  => $ROMANCE ,          
 "Liebesfilm" => $ROMANCE ,
 "Romanze"  => $ROMANCE ,          
 "Heimatfilm"  => $HISTORICAL ,       
 "Historienfilm"  => $HISTORICAL ,       
 "Erotik"  => $XXX ,              
 "Erotik/Spielfilm-Erotik" => $XXX ,             
 "Erotik/Serie-Erotik" => $XXX ,              

 "Nachrichten"  => $NEWS ,                        
 "Nachrichten/Info/Sonstige" => $NEWS ,
 "Nachrichten/Info/Politik" => $NEWS ,
 "Nachrichten/Info/Finanzen" => $NEWS ,
 "Wetter"  => $WEATHER ,          
 "Nachrichten/Info/Wetter" => $WEATHER ,          
 "Info"  => $NEWS_MAGAZINE ,    
 "Nachrichten/Info/Magazin"  => $NEWS_MAGAZINE ,   
 "Dokumentation" => $DOCUMENTARY ,
 "Literaturverfilmung" => $DOCUMENTARY ,
 "Dokufilm" => $DOCUMENTARY ,      
  "Dokumentarfilm" => $DOCUMENTARY ,      
 "Dokureihe" => $DOCUMENTARY ,      
  "Doku-Reihe" => $DOCUMENTARY ,      
  "Dokuserie" => $DOCUMENTARY ,      
   "Doku" => $DOCUMENTARY ,      
  "Studio-Doku" => $DOCUMENTARY ,       
  "Nachrichten/Info/Dokumentation"  => $DOCUMENTARY , 
 "Musikdokureihe"  => $DOCUMENTARY ,      
 "Talk"  => $DEBATE ,           


 "Series"  => Series ,             
 "Reality"  => $SHOW ,             
 "Unterhaltung/Reality"  => $SOAP ,  
 "Castingshow"  => $SOAP ,  
 "Unterhaltung/Shows"  => $SHOW,             
 "Unterhaltungsshow"  => $SHOW,
 "Unterhaltung/Game"  => $SHOW ,             
 "Unterhaltung/Sonstige"  => $NONE ,             
 "Serie/Sonstige" => $NONE ,
 "Sonstiges" => $NONE ,

 "Show"  => $GAME ,             
 "Unterhaltung"  => $GAME ,             

"Talk Show"  => $TALKSHOW ,         
  "Unterhaltung/Talkshow"  => $TALKSHOW ,         

 "Sport"  => $SPORT ,            
 "Snooker"  => Billard ,          
 "Langlauf"  => $Winter_Sports ,          
 "Autosport"  => $SPORT ,            
 "Sport/Golf"  => $SPORT ,            
 "Radsport"  => $SPORT ,            
 "Sport/Radsport"  => $SPORT ,            
 "Sport/Sonstige"  => $SPORT ,            
 "Extremsport" => $SPORT ,            
 "Special Event"  => $SPORT_SPECIAL ,    
  "Sport/Besondere Ereignisse"  => $SPORT_SPECIAL ,    
  "Sport Magazin"  => $SPORT_MAGAZINE ,   
   "Sport/Reportage"  => $SPORT_MAGAZINE ,   
 "Fußball"  => $FOOTBALL ,         
 "Fussball"  => $FOOTBALL ,         
 "Sport/Fußball"  => $FOOTBALL ,         
 "Squash"  => $TENNIS ,         
 "Sport/Squash"  => $TENNIS ,         
 "Tennis"  => $TENNIS ,           
 "Tischtennis"  => $TENNIS ,           
 "Sport/Tennis"  => $TENNIS ,           
 "Team Sport"  => $SPORT_TEAM ,       
 "Teamsport"  => $SPORT_TEAM ,       
 "Sport/Mannschaftssport"  => $SPORT ,       
 "Leichtathletik"  => $ATHLETICS ,        
 "Sport/Leichtathletik"  => $ATHLETICS ,        
 "Motorsport"  => $SPORT_MOTOR ,      
 "Motorradsport"  => $SPORT_MOTOR ,      
 "Sport/Motorsport"  => $SPORT_MOTOR ,      

 "Wassersport"  => $SPORT_WATER , 
 "Sport/Wassersport"  => $SPORT_WATER ,
 "Wintersport"  => $Winter_Sports ,
 "Sport/Wintersport"  => $Winter_Sports ,
 "Skispringen" => $Winter_Sports ,
 "Ski alpin" => $Winter_Sports ,
 "Skiakrobatik"  => $Winter_Sports ,
 "Nordische Kombination" => $Winter_Sports ,
 "Reitsport"    => $EQU ,  
 "Sport/Reiten"    => $EQU ,
 "Kampfsport" => $MARTIAL ,
 "Judo" => $MARTIAL ,
 "Sport/Kampfsport" => $MARTIAL ,
 "Bogenschießen"  => $SPORT_SPECIAL ,

 "Kinder"  => $KIDS ,
 "Kids"    => $KIDS ,
 "Jugend"  => $KIDS ,             
 "Kinderfilm" => $KIDS ,
 "Jugendfilm" => $KIDS ,
 "Märchenfilm" => $KIDS ,
 "Kinder/Jugend/Serien" => $KIDS ,             
  "Kinderabenteuer" => $KIDS ,             
 "Kinder/Jugend/Show" => $KIDS ,
 "Kinderkomödie" => $KIDS ,
 "Kinderkrimi" => $KIDS ,
 "Kinder, 0 6"  => $KIDS_0_5 ,         
 "Kids, 0 6" => $KIDS_0_5 ,
 "Kinder, 6 14"  => $KIDS_6_14 ,        
 "Kinder, 10 16"  => $KIDS_10_16 ,
 "Kids, 10 16" => $KIDS_10_16 ,
 "Kids, 6 14"  => $KIDS_6_14 ,
 "Zeichentrick"  => $CARTOON ,         
 "Zeichentrickserie"  => $CARTOON ,
 "Zeichentrickfilm"  => $CARTOON ,
 "Animationsfilm" => $CARTOON ,
 "Trickfilm" => $CARTOON ,
 "Spielfilm/Zeichentrick" => $CARTOON ,          

 "Musik"  => $MUSIC ,            
 "Musikfilm"  => $MUSIC ,            
 "Easy Listening"  => $MUSIC ,            
 "Musik/Sonstige" => $NONE ,
  "Clipcharts" => $MUSIC , 
 "Ballett"  => $MUSIC ,            
  "Tanz"  => $MUSIC ,            
  "Ballet" => $MUSIC ,
  "Tanzdoku"  => $MUSIC ,            
  "Musikdoku"  => $MUSIC ,            
  "Rock"  => $ROCK_POP ,         
  "Pop"  => $ROCK_POP ,         
 "Klassik"  => $CLASSICAL ,        
 "Volksmusik"  => $FOLK ,             
 "Jazz"  => $JAZZ ,             
 "Musical"  => $OPERA ,            
 "Musik/Musical"  => $OPERA ,            
 "Musik/Oper"  => $OPERA ,            
 "Spielfilm/Musical"  => $OPERA ,            
 "Konzert"               =>$OPERA ,
"Oper"  => $OPERA ,            
"Kunst"  => $CULTURE ,         
"Kunst Magazin"  => $CULTURE ,         
"Kunstmagazin"  => $CULTURE ,         
"Kunstdoku"  => $CULTURE ,         
  "Kunstreportage"  => $CULTURE ,         
 "Lifestyle"  => $CULTURE ,         
 "Unterhaltung/Lifestyle"  => $CULTURE ,         
 "Kultur"  => $CULTURE ,         
 "Darstellende Kunst"  => $PERFORMING ,       
 "Darst. Kunst"  => $PERFORMING ,       
 "Porträt"  => $PERFORMING ,       
  "Portrait"  => $PERFORMING ,       
 "Bildende Kunst"  => $FINE_ARTS ,        
 "Religion"  => $RELIGION ,         
 "Themen/Religion"  => $RELIGION ,         
 "Populäre Kunst"  => $POPULAR_ART ,      
 "Literatur"  => $LITERATURE ,       
 "Literaturmagazin" => $LITERATURE ,
 "Film"  => $FILM ,             
  "Kino"  => $FILM ,             
 "Politik"  => $SOCIAL ,           
 "Themen/Politik"  => $SOCIAL ,          
 "Magazin"  => $MAGAZINE ,         
  "Wissen"  => $MAGAZINE ,         
 "Reportage"  => $MAGAZINE ,         
 "Report" => $MAGAZINE ,
 "Reportagereihe"  => $MAGAZINE ,         
 "Wissenschaft"  => $ECONOMIC ,         
 "Themen/Wissenschaft"  => $ECONOMIC ,         
 "Wirtschaft"  => $ECONOMIC ,         
 "Themen/Wirtschaft"  => $ECONOMIC ,         
 "Berühmte Leute"  => $VIP ,              

 "Weiterbildung"  => $SCIENCE ,     
 "Fortbildung" => $SCIENCE ,
 "Bildung"  => $SCIENCE ,          
 "Themen/Bildung" => $SCIENCE ,          
  "Geschichte"  => $SCIENCE ,          
   "Themen/Geschichte"  => $SCIENCE ,          
 "Natur"  => $NATURE ,           
 "Themen/Natur"  => $NATURE ,           
 "Technologie"  => $TECHNOLOGY ,       
"Medizin"  => $MEDECINE ,         
 "Expeditionen"  => $FOREIGN ,          
 "Soziales"  => $SPIRITUAL ,        

 "Sprachen"  => $LANGUAGES ,       
 "Freizeit"  => $HOBBIES ,          
 "Garten"  => $HOBBIES ,          
 "Unterhaltung/Haus&Garten"  => $HOBBIES ,          
 "Special Interest/Sonstige"  => $NONE ,          
 "Reisen"  => $TRAVEL ,           
"Themen/Reise"  => $TRAVEL ,           
"Reisedoku"  => $TRAVEL ,           
 "Unterhaltung/Kunst und Handwerk"  => $HANDICRAF ,
 "Heimwerken" => $HANDICRAF ,
 

 "Rund Ums Auto"  => $MOTORING ,         
 "Gesundheit"  => $FITNESS ,          
 "Themen/Gesundheit" => $FITNESS ,          
 "Kochen"  => $COOKING ,          
 "Unterhaltung/Kochen"  => $COOKING ,          
 "Shopping"  => $SHOPPING ,         
"Mode"  => $GARDENING ,        
 "Liveübertragung"  => $LIVE ,        
"Undefiniert" => $NONE ,

 ) ; 

my $PRE  = '<category lang=\"de\">' ;
my $POST = '</category>'  ;

sub myfilter {
  my ($a) = @_;
  if ( exists $REPLACE{$a} ) {     
      return $REPLACE{$a} ;
  } else {
      print STDERR "Warning: Unmanaged category: '$a'\n" ;
      return $a ;
  }
}


while (<>) {
    my $line = $_ ;
    if ($line =~ /'(n)'/)
       {       
        $line =~ tr/\(n)//;
       }    
    if ($line =~ /parentId/)
       {
        @fields = split/,/, $line;
           $zeile = $fields[0];
           $anhang = $zeile."</sub-title>\n";
           $line = $anhang;
       }

        $line =~ s/($PRE)(.*)($POST)/"$1".myfilter("$2")."$3"/ge ;
    print $line;
} 
