# refresh with 
#    $('.list-group a').each(function(){ console.log($(this).attr('href')); });

function rawurlencode() {
  local string="${1}"	
  local strlen=${#string}
  local encoded=""

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

if [ $(whoami) == "owocki" ]; then
	ROOT_URL="http://localhost:3000/"
else
	ROOT_URL="http://hntrends.com/"
fi

HEADERS=" "

echo "search/nyc,silicon+valley,san+francisco,boulder,seattle,los+angeles
search/airbnb,loopt,dropbox,heroku,wufoo,Reddit,OMGPop,Mixpanel
search/ycombinator,techstars,dreamit,500+startups,angelpad,alchemist
search/digital+ocean,Filtrbox,Sendgrid,Brightkite,Sphero,Occipital,Keen.io
search/hillary+clinton,jim+webb,john+biden,elizabeth+warren
search/hillary+clinton,barack+obama,john+edwards
search/rand+paul,jeb+bush,ted+cruz,chris+christie,mike+huckabee,rick+santorum
search/john+mccain,paul+ryan,mitt+romney,mike+huckabee
search/seo,social,privacy,sharing,security,wearables
search/bitcoin,streaming,messaging,glass,tablets
search/nytimes,buzzfeed,wsj,blogger,cnn,huffington+post
search/flipkart,india+times
search/apple,google,yahoo,microsoft,facebook,twitter
search/ebay,amazon,paypal,craigslist
search/nsa,dhs,dod,doj,epa,fda,fema
search/php,ruby,python,node.js,c++,Objective-C
search/scala,haskell,go,scheme
search/rails,express,django,sinatra
search/svn,git,mercurial
search/adderall,psilocybin,LSD,marijuana,cocaine
search/terrorism,shooting,evolution,drones
search/socialism,capitalism,communism
search/wind,solar,coal,nuclear,oil
search/healthcare,abortion,torture,marijuana,racism
search/taxes,racism,guns,gay,police
search/thailand,darfur,vietnam,afghanistan,iraq,iran
search/digg,23andme,admob,bittorrent,linkedin,slide
search/instagram,quora,Chatroulette
search/kickstarter,medium,circa,clear,42floors
search/paul+graham,david+cohen,mark+cuban,mark+suster,tim+ferris,fred+wilson
search/brad+feld,fred+wilson,marc+andreessen,chris+dixon
search/ashton+kutcher,justin+timberlake,alexis+oharian
search/bill+gates,steve+jobs,mark+zuckerberg,larry+paige,larry+ellison" | while read uri; do
uri=$(rawurlencode "$uri")
URL=$(echo "$ROOT_URL$uri" | sed 's/%2c/,/g' | sed 's/%2f/\//g' | sed 's/%2b/+/g' )

echo "START $(date) $URL"
curl --fail --silent $URL $HEADERS > /dev/null
NEW_URL="$URL/monthly/1000"

echo " -- $NEW_URL"
curl --fail --silent $NEW_URL $HEADERS > /dev/null
NEW_URL="$URL/yearly/1000"

echo " -- $NEW_URL"
curl --fail --silent $NEW_URL $HEADERS > /dev/null
echo "DONE $(date) $URL"

sleep 10

done
