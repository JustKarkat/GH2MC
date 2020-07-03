# GH2MC
This is a converter from Guitar Hero Charts (notes.chart) to 
[PhoenixSC's Guitar Hero in Minecraft Map.](http://phoenixsc.me/download-links/guitar-hero-1-16-1/)
 
This is written in Python, and (as far as I have tested) works
on Windows, though MacOS/Linux may work as well (untested).

## INSTRUCTIONS:

1. Ensure that both the track_template.mcfunction file and the
main_template.mcfunction file are placed next to the python
script.

2. Find the path to your chart file (file can simply be dragged
into the command prompt window when prompted for the location)

3. Enter the length of the song (simply the length in time found
in the .ogg file)

4. If everything works out, it should tell you that it succeeded
in creating the new function files, and they can be found next to
the python script as "track.mcfunction" and "main_mcfunction".

5. Modify the song.ogg file so that it is lower in volume, as 
Guitar Hero and Clone Hero lower volume whereas minecraft will not.

6. Open the resources.zip file and place the song.ogg file under
"resources.zip\assets\minecraft\sounds\"

7. Download the map from PhoenixSC's link (as posted above).

8. Open the map files and go to 
"\datapacks\datapack_default\data\scripts\functions\"
replace the two files within the folder with the newly
generated main and track mcfunction files.

9. Replace the resources.zip file in the main world folder.

10. Place the map within your saves file and load the map!
From here the process is the same as PhoenixSC's original
map!
