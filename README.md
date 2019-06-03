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

• EPGScripts/tvgidmapper/tvgidmapper.pl perl script converts any tvgidś in an IPTV.m3u List file to comply with the Provided Channelidś in EPG.xml
usage : tvgidmapper.pl  old.m3u > new.m3u

• EPGScripts/new_imdbmapper/run.pl works like normal "Imdbmapper", but start 4 Tasks for faster IMDB Download.
usage : run.pl old.xml new.xml

