# EPGScripts
Scripts for modifying XML-EPG 

• EPGScripts/genremapper/genremapper.pl perl script is generic and converts any xmltv.xml file to comply with tvheadend genre   requirements.
usage : genremapper.pl < old.xml > new.xml

• EPGScripts/imdbmapper/imdbmapper.pl try to find "Titles" on imdb.com and modify / add the following Strings if a match was found and not skipped by the integrated Categoryfilter.
-Age-Rating
-Star-Rating
-Date
-Year
-Poster
usage : imdbmapper.pl old.xml > new.xml
IMDBb Engine is forked from : https://github.com/FabianBeiner/PHP-IMDB-Grabber

• EPGScripts/ratingmapper/ratingmapper.pl converts any xmltv.xml file for viewing country,date,age-rating,star-rating like
  (USA) 2009 • FSK 12 • IMDb ★★★★☆ on top of the description.
usage : ratingmapper.pl old.xml > new.xml
