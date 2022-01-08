#!/bin/bash
res=""
url=""
threads=2
videos_count=0
Help() {    # Display Help
   echo "Download video/playlist from youtube using youtube-dl command"
   echo
   echo "Syntax: youtube-dl <OPTIONS>  | -h "
   echo "Options:"
   echo "   -r     Resolution for the video/playlist 144|240|360|480|720|1080|....."
   echo "   -u     Playlist URL."
   echo "   -p     Number of thread to download the playlist videos in parallel default to 1 thread."
   echo "   -h     Print this help message."
   echo
}

# Get the options
while getopts :r:u:p:h option; do
   case $option in
      r) # resolution  
        res=$OPTARG
        ;;
      u) # playlist url
         url=$OPTARG
         ;;
      p) # parallel download for the playlist videos default to one
         threads=$OPTARG
         [ -z "$threads" ] && threads=2
         ;;
      h) # display help message
         Help
         exit;;
      \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
[ -z "$res" ] && echo " error resolution empty." && exit 
[ -z "$url" ] && echo " error url empty." && exit 

if [[ $threads > 1 ]]; then

     videos_count=`yt-dlp -J $url | python -c 'import sys,json; print len(json.load(sys.stdin)["entries"])'`

      #ceiling the number of videos in each thread  
      vid_count_for_each_thread=(videos_count+threads-1)/threads


      for ((i = 0 ; i < $threads ; i++));
        do 
          yt-dlp -N 8 --playlist-start $(( i * vid_count_for_each_thread + 1 )) --playlist-end $(( i * vid_count_for_each_thread + vid_count_for_each_thread )) -if "bestvideo[height<=$res]+bestaudio/best[height<=$res]" $url & 
  
      done
  else
    
      yt-dlp -N 8 -if "bestvideo[height<=$res]+bestaudio/best[height<=$res]" $url
fi
