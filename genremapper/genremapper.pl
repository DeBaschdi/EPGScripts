#!/usr/bin/perl -w 

##########################################
## Horizon +tv.de +tvtoday +Magentatv   ##
## Mapper                               ##
## Revision 9                           ##
## github.com/DeBaschdi                 ##
## takealug.de                          ##
##########################################

#Output Datei für Fehlermeldungen
my $genre_error = "genre_error.txt";

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

##Exclude warnings for correct EIT Genre
"Movie / Drama" =>   $MOVIE,
"Detective / Thriller" =>   $THRILLER,
"Adventure / Western / War" =>   $ADVENTURE,
"Science fiction / Fantasy / Horror" =>   $SF,
"Comedy" =>   $COMEDY,
"Soap / Melodrama / Folkloric" =>   $SOAP,
"Romance" =>   $ROMANCE,
"Serious / Classical / Religious / Historical movie / Drama" =>   $HISTORICAL,
"Adult movie / Drama" =>   $XXX, 

"News / Current affairs" =>   $NEWS,
"News / Weather report" =>   $WEATHER,
"News magazine" =>   $NEWS_MAGAZINE,
"Documentary" =>   $DOCUMENTARY,
"Discussion / Interview / Debate" =>   $DEBATE,

"Show / Game show" =>   $SHOW, 
"Game show / Quiz / Contest" =>   $GAME,
"Variety show" =>   $VARIETY,
"Talk show" =>   $TALKSHOW,

"Sports" =>  $SPORT,
"Special events (Olympic Games, World Cup, etc.)" =>  $SPORT_SPECIAL,
"Sports magazines" =>  $SPORT_MAGAZINE,
"Football / Soccer" =>  $FOOTBALL,
"Tennis / Squash" =>  $TENNIS,
"Team sports (excluding football)" =>  $SPORT_TEAM,
"Athletics" =>  $ATHLETICS,
"Motor sport" =>  $SPORT_MOTOR,
"Water sport" =>  $SPORT_WATER,
"Winter sports" =>  $Winter_Sports,
"Equestrian"  =>  $EQU,
"Martial Sports"  =>  $MARTIAL,

"Children's / Youth programs" =>  $KIDS,
"Pre-school children's programs" =>  $KIDS_0_5,
"Entertainment programs for 6 to 14" =>  $KIDS_6_14,
"Entertainment programs for 10 to 16" =>  $KIDS_10_16,
"Informational / Educational / School programs" =>  $EDUCATIONAL,
"Cartoons / Puppets" =>  $CARTOON,

"Music / Ballet / Dance" =>  $MUSIC, 
"Rock / Pop" =>  $ROCK_POP,
"Serious music / Classical music" =>  $CLASSICAL,
"Folk / Traditional music" =>  $FOLK,
"Jazz" =>  $JAZZ,
"Musical / Opera" =>  $OPERA, 

"Arts / Culture (without music)"  =>  $CULTURE, 
"Performing arts"  =>  $PERFORMING,
"Fine arts"  =>  $FINE_ARTS,
"Religion"  =>  $RELIGION,
"Popular culture / Traditional arts"  =>  $POPULAR_ART,
"Literature"  =>  $LITERATURE,
"Film / Cinema"  =>  $FILM,
"Experimental film / Video"  =>  $EXPERIMENTAL_FILM,
"Broadcasting / Press"  =>  $BROADCASTING,


"Social / Political issues / Economics"  =>  $SOCIAL,
"Magazines / Reports / Documentary"  =>  $MAGAZINE,
"Economics / Social advisory"  =>  $ECONOMIC,
"Remarkable people"  =>  $VIP,

"Education / Science / Factual topics"  =>  $SCIENCE,
"Nature / Animals / Environment"  =>  $NATURE,
"Technology / Natural sciences"  =>  $TECHNOLOGY,

"Medicine / Physiology / Psychology"  =>  $MEDECINE,
"Foreign countries / Expeditions"  =>  $FOREIGN,
"Social / Spiritual sciences"  =>  $SPIRITUAL,
"Further education"  => $FURTHER_EDUCATION,
"Languages"  =>  $LANGUAGES,

"Leisure hobbies"  =>  $HOBBIES,
"Tourism / Travel"  =>  $TRAVEL,
"Reisemagazin" =>  $TRAVEL,
"Handicraft"  =>  $HANDICRAF,
"Motoring"  =>  $MOTORING,
"Fitness and health"  =>  $FITNESS,
"Cooking"  =>  $COOKING,
"Advertisement / Shopping"  =>  $SHOPPING,
"Gardening"  =>  $GARDENING,
"Fashion"  =>  $FASHION,

"Live Broadcast"  =>  $LIVE,
"Keine Informationen Enthalten"  =>  $NONE,

###AB Hier werden die Grabber Genre/category nach unseren definierten EIT Genre gemappt###

 "Movie"  => $MOVIE ,
 "movie"  => $MOVIE ,           
 "Spielfilm"  => $MOVIE ,
 "Filmessay"  => $MOVIE ,
 "Familienfilm" => $MOVIE ,
 "Spielfilm/Sonstige"  => $MOVIE , 
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
 "Krimiserie" => $THRILLER ,
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
 "Fantasy" => $SF ,
 "Horror"  => $SF ,               
 "Spielfilm/Horror"  => $SF ,               
 "Spielfilm/Fantasy"  => $SF ,              
 "Fantasyfilm" => $SF ,
 "Science-Fiction-Action" => $SF ,
 "ScienceFiction" => $SF ,
 "Komödie"  => $COMEDY ,           
 "Teenagerkomödie" => $COMEDY ,
 "Fantasykomödie" => $COMEDY ,
 "Familienkomödie" => $COMEDY ,
 "Tragikomödie" => $COMEDY ,
 "Theaterkomödie" => $COMEDY ,
 "Spielfilm/Comedy"  => $COMEDY ,           
 "Serie/Comedy"  => $COMEDY ,           
 "Unterhaltung/Comedy" => $COMEDY , 
 "Weihnachtskomödie" => $COMEDY ,
 "Actionkomödie" => $COMEDY ,
 "Comedy" => $COMEDY ,
 "Satire" => $COMEDY ,
 "Drama (serie)"  => $SOAP ,             
 "Serie/Drama"  => $SOAP , 
 "Series Drama" => $SOAP ,
 "Serie/Soap"  => $SOAP ,             
 "Theater"  => $SOAP ,
 "Soap"  => $SOAP ,
 "Sitcom"  => $SOAP ,
 "Romance"  => $ROMANCE ,          
 "Serie/Romantik"  => $ROMANCE ,          
 "Spielfilm/Romantik"  => $ROMANCE ,          
 "Liebesfilm" => $ROMANCE ,
 "Romanze"  => $ROMANCE ,  
 "Romantik"  => $ROMANCE ,
 "Heimatfilm"  => $HISTORICAL ,       
 "Historienfilm"  => $HISTORICAL ,       
 "Erotik"  => $XXX ,
 "Adult"  => $XXX ,            
 "Erotik/Spielfilm-Erotik" => $XXX ,             
 "Erotik/Serie-Erotik" => $XXX ,
 "Erotischer Film" => $XXX ,
 "erotiek" => $XXX ,
 "Erotiek" => $XXX ,
 "Erotyka" => $XXX ,
 "program erotyczny" => $XXX ,
 "Proprietary" => $XXX ,
 "VOLWASSENEN" => $XXX ,
 "film erotyczny" => $XXX ,
 "Nachrichten"  => $NEWS ,
 "News"      => $NEWS ,
 "Wiadomości"  => $NEWS ,
 "Nachrichten/Info/Sonstige" => $NEWS ,
 "Nachrichten/Info/Politik" => $NEWS ,
 "Nachrichten/Info/Finanzen" => $NEWS ,
 "Wetter"  => $WEATHER ,          
 "Nachrichten/Info/Wetter" => $WEATHER ,          
 "Info"  => $NEWS_MAGAZINE ,    
 "Nachrichten/Info/Magazin"  => $NEWS_MAGAZINE ,   
 "Dokumentation" => $DOCUMENTARY ,
 "Documentary" => $DOCUMENTARY ,
 "Dokument" => $DOCUMENTARY ,
 "Literaturverfilmung" => $DOCUMENTARY ,
 "Dokufilm" => $DOCUMENTARY ,
 "Modedoku" => $DOCUMENTARY ,
 "Dokumentarfilm" => $DOCUMENTARY ,      
 "Dokureihe" => $DOCUMENTARY ,      
 "Doku-Reihe" => $DOCUMENTARY ,      
 "Dokuserie" => $DOCUMENTARY ,      
 "Doku" => $DOCUMENTARY ,      
 "Studio-Doku" => $DOCUMENTARY ,
 "Dokuporträt" => $DOCUMENTARY ,
 "Nachrichten/Info/Dokumentation"  => $DOCUMENTARY , 
 "Musikdokureihe"  => $DOCUMENTARY ,
 "Drehbericht"  => $DOCUMENTARY ,
 "Dokusoap"  => $DOCUMENTARY ,
 "Talk"  => $DEBATE ,           
 "Gespräch"  => $DEBATE ,

 "Series"  => Series ,             
 "Reality"  => $SHOW , 
 "Clipshow"    => $SHOW ,        
 "Unterhaltung/Reality"  => $SOAP ,  
 "Castingshow"  => $SOAP ,  
 "Unterhaltung/Shows"  => $SHOW,   
 "Program Rozrywkowy"  => $SHOW, 
 "Unterhaltungsshow"  => $SHOW,
 "Unterhaltung/Game"  => $SHOW ,
 "Spielshow"  => $SHOW ,
 "Unterhaltung/Sonstige"  => $NONE ,             
 "Serie/Sonstige" => $NONE ,
 "Sonstiges" => $NONE ,
 "Programminformation" => $NONE ,
 "Sendepause" => $NONE ,

 "Show"  => $GAME ,             
 "Unterhaltung"  => $GAME ,             

 "Talk Show"  => $TALKSHOW ,  
 "Unterhaltung/Talkshow"  => $TALKSHOW ,         
 "Talkshow"  => $TALKSHOW , 
 
 "Sport"  => $SPORT ,
 "sports"  => $SPORT ,
 "Basketball"  => $SPORT_TEAM ,
 "deGenHandball"  => $SPORT_TEAM ,
 "Snooker"  => $SPORT , 
 "Billard"  => $SPORT ,
 "Langlauf"  => $Winter_Sports ,          
 "Eisschnellauf" => $Winter_Sports ,
 "Autosport"  => $SPORT ,            
 "Sport/Golf"  => $SPORT , 
 "deGenGolf"   => $SPORT ,          
 "Radsport"  => $SPORT ,            
 "Sport/Radsport"  => $SPORT ,            
 "Sport/Sonstige"  => $SPORT ,            
 "Fechten" => $SPORT ,
 "Extremsport" => $SPORT ,
 "Curling" => $SPORT ,
 "enGenIceHockey" => $SPORT ,
 "deGenIceHockey" => $SPORT ,
 "frGenIceHockey" => $SPORT ,
 "Special Event"  => $SPORT_SPECIAL ,    
 "Sport/Besondere Ereignisse"  => $SPORT_SPECIAL ,    
 "Sport Magazin"  => $SPORT_MAGAZINE ,   
 "Sport/Reportage"  => $SPORT_MAGAZINE ,   
 "Sportnews" => $SPORT_MAGAZINE ,
 "Fußball"  => $FOOTBALL ,
 "Soccer"  => $FOOTBALL ,
 "Fussball"  => $FOOTBALL ,         
 "Sport/Fußball"  => $FOOTBALL , 
 "frGenSoccer"  => $FOOTBALL , 
 "deGenSoccer"  => $FOOTBALL ,
 "enGenSoccer"  => $FOOTBALL ,      
 "Squash"  => $TENNIS ,         
 "Sport/Squash"  => $TENNIS ,         
 "Tennis"  => $TENNIS ,           
 "Tischtennis"  => $TENNIS ,
 "deGenTennis"     => $TENNIS ,
 "enGenTennis"     => $TENNIS ,
 "frGenTennis"     => $TENNIS ,
 "Sport/Tennis"  => $TENNIS ,           
 "Team Sport"  => $SPORT_TEAM ,       
 "Teamsport"  => $SPORT_TEAM ,       
 "Sport/Mannschaftssport"  => $SPORT ,       
 "Leichtathletik"  => $ATHLETICS ,
 "Gewichtheben"     => $ATHLETICS ,     
 "Sport/Leichtathletik"  => $ATHLETICS ,        
 "Motorsport"  => $SPORT_MOTOR ,
 "Motor"  => $SPORT_MOTOR ,
 "Motorradsport"  => $SPORT_MOTOR ,      
 "Sport/Motorsport"  => $SPORT_MOTOR ,
 "Formel 1"  => $SPORT_MOTOR ,
 "Rallye"  => $SPORT_MOTOR ,

 "Wassersport"  => $SPORT_WATER , 
 "Kanu"  => $SPORT_WATER ,
 "Sport/Wassersport"  => $SPORT_WATER ,
 "Schwimmen"  => $SPORT_WATER ,
 "Wintersport"  => $Winter_Sports ,
 "Sport/Wintersport"  => $Winter_Sports ,
 "Skispringen" => $Winter_Sports ,
 "Ski alpin" => $Winter_Sports ,
 "Skiakrobatik"  => $Winter_Sports ,
 "Nordische Kombination" => $Winter_Sports ,
 "Reitsport"    => $EQU ,  
 "Sport/Reiten"    => $EQU ,
 "Pferdesport"    => $EQU ,
 "Kampfsport" => $MARTIAL ,
 "enGenWrestling" => $MARTIAL ,
 "deGenWrestling" => $MARTIAL ,
 "frGenWrestling" => $MARTIAL ,
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
 "Animation" => $CARTOON ,

 "Musik"  => $MUSIC ,
 "Muziek"  => $MUSIC ,
 "Music"  => $MUSIC ,
 "Musikfilm"  => $MUSIC ,            
 "Easy Listening"  => $MUSIC ,            
 "Musik/Sonstige" => $NONE ,
 "Clipcharts" => $MUSIC , 
 "Ballett"  => $MUSIC ,            
 "Tanz"  => $MUSIC ,            
 "Ballet" => $MUSIC ,
 "Tanzdoku"  => $MUSIC ,            
 "Musikdoku"  => $MUSIC , 
 "Zeitgenössische Musik"  => $MUSIC ,
 "Programm nach Ansage" => $MUSIC ,
 "Muzyka"  => $MUSIC ,
 "Musik-Clips"  => $MUSIC ,
 "Talk und Musik"  => $MUSIC ,
 "Rock"  => $ROCK_POP ,         
 "Pop"  => $ROCK_POP , 
 "Rock und Pop"  => $ROCK_POP ,
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
 "Biografie"  => $PERFORMING , 
 "Bildende Kunst"  => $FINE_ARTS ,        
 "Religion"  => $RELIGION ,         
 "Themen/Religion"  => $RELIGION ,
 "Kirche und Religion"  => $RELIGION ,
 "Populäre Kunst"  => $POPULAR_ART ,      
 "Literatur"  => $LITERATURE ,       
 "Literaturmagazin" => $LITERATURE ,
 "Film"  => $FILM ,             
 "Kino"  => $FILM ,             
 "Politik"  => $SOCIAL ,           
 "Themen/Politik"  => $SOCIAL ,
 "Gesellschaft"  => $SOCIAL ,
 "Magazin"  => $MAGAZINE , 
 "Magazine"  => $MAGAZINE ,
 "Wissen"  => $MAGAZINE ,         
 "Reportage"  => $MAGAZINE ,
 "Designreportage"  => $MAGAZINE ,
 "Report" => $MAGAZINE ,
 "Reportagereihe"  => $MAGAZINE ,
 "Infomagazin"  => $MAGAZINE ,
 "Regionalmagazin"  => $MAGAZINE ,
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
 "Factual"  => $SCIENCE ,
 "Natur"  => $NATURE ,           
 "Themen/Natur"  => $NATURE ,
 "Kamerafahrt"  => $NATURE ,
 "Natur und Tiere"  => $NATURE ,
 "Technologie"  => $TECHNOLOGY ,       
 "Medizin"  => $MEDECINE ,         
 "Expeditionen"  => $FOREIGN ,          
 "Soziales"  => $SPIRITUAL ,        

 "Sprachen"  => $LANGUAGES , 
 "USA"  => $LANGUAGES ,
 "Freizeit"  => $HOBBIES ,
 "Leisure"  => $HOBBIES ,
 "Freizeit und Hobby"  => $HOBBIES ,
 "Garten"  => $HOBBIES ,          
 "Unterhaltung/Haus&Garten"  => $HOBBIES ,          
 "Special Interest/Sonstige"  => $NONE ,          
 "Reisen"  => $TRAVEL ,           
 "Themen/Reise"  => $TRAVEL ,           
 "Reisedoku"  => $TRAVEL ,           
 "Unterhaltung/Kunst und Handwerk"  => $HANDICRAF ,
 "Heimwerken" => $HANDICRAF ,
 "Heimwerker" => $HANDICRAF ,
 
 "Ratgeber"  => $FURTHER_EDUCATION ,
 
 "Rund Ums Auto"  => $MOTORING ,
 "Auto"  => $MOTORING ,
 "Gesundheit"  => $FITNESS ,          
 "Themen/Gesundheit" => $FITNESS ,          
 "Kochen"  => $COOKING , 
 "Kochshow"  => $COOKING ,
 "Unterhaltung/Kochen"  => $COOKING ,          
 "Shopping"  => $SHOPPING , 
 "Werbesendung" => $SHOPPING ,
 "Mode"  => $GARDENING ,        
 "Liveübertragung"  => $LIVE ,        
 "Undefiniert" => $NONE ,
 "Verschiedenes" => $NONE ,
 "Variety Show" => $VARIETY ,
 
 "Geschichtsdoku" => $DOCUMENTARY ,
 "Krimidrama" => $THRILLER ,
 "Polizeiserie" => $THRILLER ,
 "Wetterbericht" => $WEATHER ,
 "Nachrichtenmagazin" => $NEWS ,
 "Animationsserie" => $CARTOON ,
 "Polittalk" => $SOCIAL ,
 "Quiz" => $GAME ,
 "Quizshow" => $GAME ,
 "Börsenbericht" => $ECONOMIC ,
 "Boulevardmagazin" => $NEWS ,
 "Telenovela" => $ROMANCE ,
 "Daily Soap" => $SOAP ,
 "Realitysoap" => $SOAP ,
 "Reportagemagazin" => $MAGAZINE ,
 "Sci-Fi-Parodie" => $SF ,
 "Sci-Fi-Spektakel" => $SF ,
 "Buddy-Actionkomödie" => $COMEDY ,
 "Starmagazin" => $VIP ,
 "Trödelshow" => $SHOW ,
 "Beziehungsklamotte" => $SOAP ,
 "Charakterdrama" => $MOVIE ,
 "Comedyserie" => $COMEDY ,
 "Comedyshow" => $COMEDY ,
 "Episodenklamauk" => $COMEDY ,
 "Familienserie" => 
 "Gaunerkomödie" => $COMEDY ,
 "Gottesdienst" => $RELIGION ,
 "Heimatkrimi" => $THRILLER ,
 "Heimattragikomödie" => $COMEDY ,
 "Kinderserie" => $KIDS ,
 "Korrespondentenberichte" => $DEBATE ,
 "Kriminaldrama" => $THRILLER ,
 "Kulturmagazin" => $CULTURE ,
 "Lotterieshow" => $SHOW ,
 "Märchen" => $KIDS ,
 "Märchenspaß"  => $KIDS ,
 "Naturdokureihe" => $DOCUMENTARY ,
 "Politmagazin" => $MAGAZINE ,
 "Provinzkomödie" => $COMEDY ,
 "Sportmagazin" => $SPORT_MAGAZINE ,
 "Tierreportage" => $NATURE ,
 "Wirtschaftsmagazin" => $ECONOMIC ,
 "Wissens-Quizshow" => $GAME ,
 "Wissenschaftsmagazin" => $SCIENCE ,
 "Wissensmagazin" => $SCIENCE ,
 "Wissensquiz" => $GAME ,
 "Zoogeschichten" => $NATURE,


 ) ; 

my $PRE  = '<category lang=\"de\">' ;
my $POST = '</category>'  ;
open (FILE, ">>$genre_error") || "Error opening File $\n";

sub myfilter {
  my ($a) = @_;
  if ( exists $REPLACE{$a} ) {     
      return $REPLACE{$a} ;
  } else {
      print STDERR "Warning: Unmanaged category: '$a'\n" ;
      print FILE "Warning: Unmanaged category: '$a'\n" ;
      return $a ;
  }
}

while (<>) {
    my $line = $_ ;
    $line =~ s/($PRE)(.*)($POST)/"$1".myfilter("$2")."$3"/ge ;
    print $line;
}  
close(FILE);
