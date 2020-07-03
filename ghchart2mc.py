# By JustKarkat/JustJedi_
# Credit for original map to PhoenixSC (http://phoenixsc.me/)

import os

note_offset = 0

#thank https://specterdev.ca/2018/writing-rhythm-game-engine-p3/ for GH -> Seconds
# this function converts the note offsets from the .chart file into ticks for minecraft
def barstomctick(BPM, TS, Resolution, chartnum, previous_note, note_deviation):

    global note_offset
    #msperbar = (TS / (BPM / 1000)) * 60 * 1000
    #secpertick = (msperbar / (Resolution * TS)) / 1000

    conversion = (((chartnum) * 60) / (BPM * Resolution) * 1000 * 20) - (((previous_note) * 60) / (BPM * Resolution) * 1000 * 20)
    
    

    note_offset += conversion
    #print(note_offset * 20)
    #converts to minecraft ticks

    return int(note_offset) - note_deviation

#this is the main function that converts the .chart file into mcfunction files
def converter(chart):
    note_deviation = 0
    #opens all files needed
    file = open(chart)
    chart = file.read()
    path = os.path.join(os.path.dirname(__file__), "main_template.mcfunction")
    file = open(path)
    main_mcfunction = file.read()
    path = os.path.join(os.path.dirname(__file__), "track_template.mcfunction")
    file = open(path)
    track_mcfunction = file.read()
    file.close()
    #Sets the song name, artist, charter, etc. & requests song length for main.function file
    name = chart.partition("Name = ")[2].split('"')[1]
    artist = chart.partition("Artist = ")[2].split('"')[1]
    length = input("How long is the song? ")
    note_deviation = input("What is the necessary note deviation? ")
    charter = chart.partition("Charter = ")[2].split('"')[1]
    song_title = name + " - " + artist + " - " + length + " - " + charter
    main_mcfunction = main_mcfunction.replace('replsong', song_title)

    #converts [SyncTrack] and [Notes] into track.mcfunction file
    BPM = [0] * 128000
    TS = [0] * 128000
    Resolution = int(chart.partition("Resolution = ")[2].split(' ')[0]) # Stores Resolution
    
    SyncTrack = chart.partition('[SyncTrack]\n{\n')[2].split('}')[0].split("\n")
    i = 0
    while i < len(SyncTrack) - 1: # Stores all Time Signature Changes
        if SyncTrack[i].partition(" = ")[2].split(" ")[0] == "TS":
            TS[int(SyncTrack[i].partition(" = ")[0].strip())] = int(SyncTrack[i].partition(" = ")[2].split(" ")[1])
            
        if SyncTrack[i].partition(" = ")[2].split(" ")[0] == "B": # Stores all BPM Changes
            BPM[int(SyncTrack[i].partition(" = ")[0].strip())] = int(SyncTrack[i].partition(" = ")[2].split(" ")[1])

        SyncTrack[i].partition(" = ")[0].strip()
        i += 1
    
    #finds the largest tick in the [ExpertSingle] in .chart file
    Ticks = chart.partition('[ExpertSingle]\n{\n')[2].split('}')[0].split("\n")
    
    Ticks = [x for x in Ticks if x.strip()]
    store = Ticks
    for i in enumerate(Ticks):
        temptick = Ticks[i[0]].strip().partition(" = ")[2].split(" ")[1].strip()
        if int(temptick.strip()) >= 5:
            store.pop(i[0])
    Ticks = [x for x in store if "solo" not in x]
    store = [x for x in store if "solo" not in x]
    for i in enumerate(Ticks):
        store[i[0]].strip()
        Ticks[i[0]] = Ticks[i[0]].strip().partition(" = ")[0].strip()

    maxTicks = int(Ticks[-1])

   
    num_notes = 0 

    curBPM = BPM[0]
    curTS = TS[0]
    previous_note = 0
    i = 0
    #iterates through all ticks until maxticks
    
    while i <= maxTicks:
        #sets proper BPM for conversion/calculation to minecraft ticks
        try:
            if curBPM != BPM[i] and BPM[i] != 0:
                curBPM = BPM[i]
            if curTS != TS[i] and TS[i] != 0:
                curTS = TS[i]
        except IndexError:
            pass    
        
        
        #print(str(curBPM) + " " + str(curTS)) 
        currenttick = str(barstomctick(curBPM, curTS, Resolution, int(Ticks[int(i/192)]), int(previous_note), int(note_deviation)))
        if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[2]) == 0:
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 0:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 63 13 {Tags:["green","note","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 1:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 63 13 {Tags:["red","note","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 2:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 63 13 {Tags:["yellow","note","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 3:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 63 13 {Tags:["blue","note","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 4:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 63 13 {Tags:["orange","note","symbol","pos"]}' + "\n#"
        if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[2]) > 0:
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 0:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 2 65 13 {Tags:["green","line","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 1:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 1 65 13 {Tags:["red","line","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 2:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand 0 65 13 {Tags:["yellow","line","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 3:
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand -1 65 13 {Tags:["blue","line","symbol","pos"]}' + "\n#"
            if int(store[int(i/192)].partition(" = ")[2].strip().split(" ")[1]) == 4: 
                track_mcfunction = track_mcfunction + "execute if score @p timer matches " + currenttick + ' run summon minecraft:armor_stand -2 65 13 {Tags:["orange","line","symbol","pos"]}' + "\n#"
        track_mcfunction = track_mcfunction + currenttick + "\n"
        previous_note = Ticks[int(i/192)]  

        num_notes += 1
        i += Resolution
    main_mcfunction = main_mcfunction.replace('{set_accuracy}', str(num_notes))
    track_mcfunction = track_mcfunction.replace("{length}", str(int(track_mcfunction.split("\n")[-2].strip("#")) + 400))
    #print(track_mcfunction)
    output_file = None
    try:
        output_file = open("track.mcfunction", "w")
    except IOError:
        print("Failed to open track.mcfunction for writing\n")
    else:
        print("\nSuccess! Wrote 'track_mcfuntion' to a file.\n")
        output_file = output_file.write(track_mcfunction)
    try:
        print("Success! Wrote 'main_mcfuntion' to a file.\n")
        output_file = open("main.mcfunction", "w")
    except IOError:
        print("Failed to open main.mcfunction for writing\n")
    else:
        output_file = output_file.write(main_mcfunction)

    
    #print(track_mcfunction)

converter(input("Enter Chart Location: "), )