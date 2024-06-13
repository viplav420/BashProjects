#!/bin/bash

# Directory to organize
DIR=$DirectoryPath

# Check if a directory was provided
if [ -z "$DIR" ]; then
    echo "Usage: $0 directory"
    exit 1
fi

# Check if the provided directory exists
if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist."
    exit 1
fi

# Create subdirectories for different file types
mkdir -p "$DIR/images" "$DIR/documents" "$DIR/archives" "$DIR/videos" "$DIR/music" "$DIR/others"

# Move files into respective directories
for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        case "$file" in
            *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.tiff) mv "$file" "$DIR/images/" ;;
            *.txt|*.pdf|*.doc|*.docx|*.xls|*.xlsx|*.ppt|*.pptx|*.odt|*.rtf) mv "$file" "$DIR/documents/" ;;
            *.zip|*.tar|*.gz|*.bz2|*.7z|*.rar) mv "$file" "$DIR/archives/" ;;
            *.mp4|*.mkv|*.avi|*.mov|*.wmv|*.flv|*.webm) mv "$file" "$DIR/videos/" ;;
            *.mp3|*.wav|*.aac|*.flac|*.ogg|*.m4a) mv "$file" "$DIR/music/" ;;
            *) mv "$file" "$DIR/others/" ;;
        esac
    fi
done

echo "Files have been organized."

