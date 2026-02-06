Lyrwal2 is a simple program I made to set my wallpaper to an image of random song lyrics from artists.

Setup:
  1) Install the package

     Using AUR helper:
     > yay -S lyrwal2
     > 
     OR only using git:
     
     If using this method, first ensure that you have these installed: gcc, make, python, freetype2 
     > git clone --recursive https://github.com/ZerimGH/lyrwal2.git && cd lyrwal2 && ./install.sh
     > 
  3) Get an API key for genius lyrics from https://genius.com/api-clients (free)
  4) Run lyrwal2, and let it generate default configs
     > lyrwal2 update
  5) Add your API key to the config file at ~/.config/lyrwal2/config.toml
  
     Look for the lines:
     > [genius]
     > 
     > api_key = "****************************************************************" # < PUT YOUR API KEY IN THESE QUOTES
     >
  6) Fill in the script for textwal2 to set your wallpaper.

     There's no generic way to update the wallpaper between wm's, so you'll need a script to do that.
     The script is at ~/.config/textwal2/set-wallpaper.sh, and is run after the wallpaper is rendered.
     An example script for X11 might look like:
     > #!/usr/bin/env bash
     >
     > \# These exports are only needed if the script will be run indirectly, by something like cronie or your wm
     >
     > export DISPLAY=:0
     >
     > export XAUTHORITY=$(ls /tmp/xauth_* | head -n 1)
     >
     > WALLPAPER_DIR=~/.config/textwal2/wallpaper/output.png
     >
     > feh --bg-fill $WALLPAPER_DIR
     > 
     You can customise colours, font, text styles, background image, resolution, and artists here at ~/.config/textwal2/config.toml
  7) Run lyrwal2 update, and your wallpaper should update :) (It will take a while to update the wallpaper until enough lyrics have been cached)
