#!/bin/sh
res=""
url=""

Help() {    # Display Help
   echo "Download video/playlist from youtube using youtube-dl command"
   echo
   echo "Syntax: youtube-dl <OPTIONS> | -h "
   echo "Options:"
   echo "   -r     Resolution for the video/playlist 144|240|360|480|720|1080|....."
   echo "   -u     The video URL"
   echo "   -h     Print this help message."
   echo
}

# Get the options
while getopts :r:u:h option; do
   case $option in
      r) # path to iso file 
        res=$OPTARG
        ;;
      u) # flash mount point
         url=$OPTARG
         ;;
      h) # dispaly help message
         Help
         exit;;
      \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
[ -z "$res" ] && echo " Error resolution empty." && exit 
[ -z "$url" ] && echo " Error url empty." && exit 




yt-dlp -N 8 -if  "bestvideo[height<=$res]+bestaudio/best[height<=$res]" $url

