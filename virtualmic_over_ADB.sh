adb connect 192.168.1.25:5555

adb forward tcp:8080 tcp:8080
echo "\nForwarded device port 8080 to localhost port 8080\n"

red='\033[31m'

if ! ./virtualmic http://127.0.0.1:8080/audio.opus; then
    echo  "${red}Error reading the stream audio file from 127.0.0.1:8080"
    echo  "${red}Make sure you are running IPWebcam App and the server is up and broadcasting"
    exit 1
fi
