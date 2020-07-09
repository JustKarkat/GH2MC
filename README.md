# GH2MC
This is a converter from Guitar Hero Charts (notes.chart) to 
[PhoenixSC's Guitar Hero in Minecraft Map.](http://phoenixsc.me/download-links/guitar-hero-1-16-1/){:target="_blank"}.
 
This is written in Python, and (as far as I have tested) works
on Windows, though MacOS/Linux may work as well (untested).

## INSTRUCTIONS:

1. Ensure that both the track_template.mcfunction file and the
main_template.mcfunction file are placed next to the python
script.

2. Find the path to your chart file (file can simply be dragged
into the command prompt window when prompted for the location)

3. Enter the length of the song (simply the length in time found
in the .ogg file) as well as the note offset (more on that later)

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

### NOTE OFFSET
Due to issues that I have currently, songs will not line up without some trial and error,
by entering a number here you can either lengthen (negative) or shorten (positive) the
time it takes for the first note to reach the bottom of the fret board.

### Editing
Feel free to request edits / report issues to this repo as any help is great!

### Known Issues
* All notes of songs do not always get converted (longer songs in particular).
* Timing issues (as above with note offset)
If you find more issues, PLEASE report them!

### TO DO
* Attempt to automate note offset.
* Test more songs to ensure that conversion is smooth and does not lose notes.
* Fix length/accuracy to ensure that songs do not end too soon or too late, and the accuracy is appropriate for the number of notes.
* Potentially add a GUI instead of command line.
