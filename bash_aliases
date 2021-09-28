export PS1="\\$ \h:\W \[$(tput sgr0)\]"

# Youtube downloader and extraction to mp3, requires ffmpeg, needs to be updated so it auto installs if the command doesn't exist
function ytdl() {
    command -v youtube-dl >/dev/null 2>&1 || { 
        echo >&2 "youtube-dl is not installed, installing youtube-dl";
        
        echo "Downloading youtube-dl"
        sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
        
        echo "Adding executable permissions"
        sudo chmod a+rx /usr/local/bin/youtube-dl
    }
    youtube-dl -x --audio-format "mp3" -o "%(title)s.%(ext)s" $1
}

# Print out the current directory's filesizes
function dirSize() {
    du -h -d 1 | sort -hr
}

alias gcwork="google-chrome --user-data-dir=/home/pat/Desktop/google-chrome-work/"
alias gcxup="google-chrome --user-data-dir=/home/pat/Desktop/google-chrome-xup/"
