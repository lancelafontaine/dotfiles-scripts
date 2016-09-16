#!/usr/bin/env python3

import subprocess
import re

playerStatus = subprocess.Popen("playerctl --player=spotify status", stdout=subprocess.PIPE, shell=True)
(playerStatusOutput, err) = playerStatus.communicate()

songIsPlaying = re.match(r'Playing', playerStatusOutput.decode('utf-8'))
if (songIsPlaying):
    icon = ""
    playerArtist = subprocess.Popen("playerctl --player=spotify metadata xesam:artist", stdout=subprocess.PIPE, shell=True)
    (playerArtistOutput, err) = playerArtist.communicate()
    artist = playerArtistOutput.decode('utf-8')
    
    playerSong= subprocess.Popen("playerctl --player=spotify metadata xesam:title", stdout=subprocess.PIPE, shell=True)
    
    (playerSongOutput, err) = playerSong.communicate()
    song = playerSongOutput.decode('utf-8')
    
    print(icon + "  " + artist + " - " + song)
