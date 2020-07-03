##### IMPORTS #####
scoreboard objectives add new minecraft.custom:minecraft.play_one_minute
execute if score @p new matches 1 run tp @p 0 65.1 -1 0 24
effect give @p night_vision 9999 0 true
effect give @p invisibility 9999 0 true
effect give @p resistance 9999 100 true
effect give @p instant_health 9999 100 true
effect give @p saturation 9999 0 true
team add green
team add red
team add yellow
team add blue
team add orange
execute if score Streak score matches 0..149 run team modify green color green
execute if score Streak score matches 0..149 run team modify red color red
execute if score Streak score matches 0..149 run team modify yellow color yellow
execute if score Streak score matches 0..149 run team modify blue color blue
execute if score Streak score matches 0..149 run team modify orange color gold
execute if score Streak score matches 150 run team modify green color aqua
execute if score Streak score matches 150 run team modify red color aqua
execute if score Streak score matches 150 run team modify yellow color aqua
execute if score Streak score matches 150 run team modify blue color aqua
execute if score Streak score matches 150 run team modify orange color aqua
team join green @e[tag=green]
team join red @e[tag=red]
team join yellow @e[tag=yellow]
team join blue @e[tag=blue]
team join orange @e[tag=orange]
scoreboard objectives add delay dummy
scoreboard players add delay delay 1
execute if score delay delay matches 5.. run scoreboard players set delay delay 0
scoreboard objectives add score dummy {"text":"SCORE","color":"yellow","bold":"true"}
team add main
team modify main color dark_purple
team join main @p
kill @e[type=item]


##### MAIN #####
## Setup
#execute unless entity @e[tag=green,tag=note] run summon minecraft:armor_stand 2 65 10 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["green","note"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:2}}],Glowing:1b}
#execute unless entity @e[tag=red,tag=note] run summon minecraft:armor_stand 1 65 10 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["red","note"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:4}}],Glowing:1b}
#execute unless entity @e[tag=yellow,tag=note] run summon minecraft:armor_stand 0 65 10 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["yellow","note"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:6}}],Glowing:1b}
#execute unless entity @e[tag=blue,tag=note] run summon minecraft:armor_stand -1 65 10 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["blue","note"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:8}}],Glowing:1b}
#execute unless entity @e[tag=orange,tag=note] run summon minecraft:armor_stand -2 65 10 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["orange","note"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:10}}],Glowing:1b}

execute unless entity @e[tag=green,tag=circle] run summon minecraft:armor_stand 2 65 1 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["green","circle"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:1}}]}
execute unless entity @e[tag=red,tag=circle] run summon minecraft:armor_stand 1 65 1 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["red","circle"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:3}}]}
execute unless entity @e[tag=yellow,tag=circle] run summon minecraft:armor_stand 0 65 1 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["yellow","circle"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:5}}]}
execute unless entity @e[tag=blue,tag=circle] run summon minecraft:armor_stand -1 65 1 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["blue","circle"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:7}}]}
execute unless entity @e[tag=orange,tag=circle] run summon minecraft:armor_stand -2 65 1 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["orange","circle"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:9}}]}

## Timer start
scoreboard objectives add timer dummy
scoreboard objectives add reset minecraft.used:minecraft.carrot_on_a_stick
replaceitem entity @p hotbar.0 carrot_on_a_stick
execute unless score @p timer matches 0.. run scoreboard players set @p timer 0
execute unless score @p score matches 0.. run scoreboard players set @p score 0
execute if score @p reset matches 1.. if score @p timer matches 0 run title @p title {"text":"Get ready!","color":"dark_red"}
execute if score @p reset matches 1.. if score @p timer matches 0 run scoreboard players set @p timer 1
execute if score @p reset matches 1.. if score @p timer matches 10.. run title @p title {"text":"Stopped","color":"red"}
execute if score @p reset matches 1.. if score @p timer matches 10.. run scoreboard players set @p timer 0
scoreboard players set @p reset 0

execute if score @p timer matches 0..1 as @p at @s run kill @e[tag=symbol]
execute if score @p timer matches 0..1 as @p at @s run fill 3 64 2 3 64 11 soul_soil
execute if score @p timer matches 0..1 as @p at @s run fill 3 65 2 3 65 11 air
execute if score @p timer matches 0..1 as @p at @s run fill -3 63 2 -3 63 11 air
execute if score @p timer matches 0..1 as @p at @s run stopsound @p master minecraft:song
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set @p score 0
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set missed accuracy 0
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set @p accuracy 0
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set progress accuracy 0
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set Accuracy score 0
execute if score @p timer matches 0..1 as @p at @s run scoreboard players set Streak score 0
execute if score @p timer matches 1 as @p at @s run playsound minecraft:song master @p
execute if score @p timer matches 1.. as @p at @s run scoreboard players add @s timer 1

scoreboard objectives add start dummy
execute if score @p timer matches 0..99 run scoreboard players set @p start 0
execute if score @p timer matches 100.. run scoreboard players set @p start 1

#bossbar add track {"text":"Insert track name"}
execute if score delay delay matches 0 run bossbar set track name "replsong"
execute if score delay delay matches 0 run bossbar set track players @a
execute if score delay delay matches 0 run execute store result bossbar track max run scoreboard players get track length
execute if score delay delay matches 0 run execute store result bossbar track value run scoreboard players get @p timer

## Note movement
execute if score Streak score matches 0..149 as @e[tag=green,tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:2}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=red,tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:4}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=yellow,tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:6}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=blue,tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:8}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=orange,tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:10}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=green,tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:11}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=red,tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:12}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=yellow,tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:13}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=blue,tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:14}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 0..149 as @e[tag=orange,tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:15}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}

execute if score Streak score matches 150.. as @e[tag=note] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:16}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}
execute if score Streak score matches 150.. as @e[tag=line] run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:egg",Count:1b,tag:{CustomModelData:17}}],Glowing:1b,DisabledSlots:4144959,NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1}

#Speed
execute as @e[tag=symbol] at @s run tp @s ~ ~ ~-0.285

## Mechanics
scoreboard objectives add incr dummy
execute if score Streak score matches 0..9 run scoreboard players set incr incr 50
execute if score Streak score matches 10..19 run scoreboard players set incr incr 100
execute if score Streak score matches 20..29 run scoreboard players set incr incr 150
execute if score Streak score matches 30..149 run scoreboard players set incr incr 200
execute if score Streak score matches 150.. run scoreboard players set incr incr 400

#Detect note
execute if score Streak score matches 0..149 if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=green,tag=circle] run particle flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 0..149 if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=red,tag=circle] run particle flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 0..149 if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=yellow,tag=circle] run particle flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 0..149 if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=blue,tag=circle] run particle flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 0..149 if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=orange,tag=circle] run particle flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force

execute if score Streak score matches 150.. if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=green,tag=circle] run particle soul_fire_flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 150.. if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=red,tag=circle] run particle soul_fire_flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 150.. if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=yellow,tag=circle] run particle soul_fire_flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 150.. if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=blue,tag=circle] run particle soul_fire_flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force
execute if score Streak score matches 150.. if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @e[tag=orange,tag=circle] run particle soul_fire_flame ~ ~0.25 ~ 0.0 0.0 0.0 1.0 0 force

execute if score @p start matches 1 if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add Streak score 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add Streak score 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add Streak score 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add Streak score 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add Streak score 1

execute if score @p start matches 1 if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players operation @p score += incr incr
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players operation @p score += incr incr
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players operation @p score += incr incr
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players operation @p score += incr incr
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players operation @p score += incr incr

execute if score @p start matches 1 if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add @p accuracy 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add @p accuracy 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add @p accuracy 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add @p accuracy 1
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run scoreboard players add @p accuracy 1

execute if score @p start matches 1 if data entity @p {SelectedItemSlot:2} as @e[tag=green,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run kill @s
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:3} as @e[tag=red,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run kill @s
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:4} as @e[tag=yellow,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run kill @s
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:5} as @e[tag=blue,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run kill @s
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:6} as @e[tag=orange,tag=circle] at @s positioned ~ ~ ~-0.4 as @e[tag=symbol,distance=..0.4] at @s run kill @s

#Missed
execute as @e[tag=circle] at @s positioned ~ ~ ~-2 as @e[tag=symbol,distance=..0.15] run scoreboard players set Streak score 0
execute as @e[tag=circle] at @s positioned ~ ~ ~-2 as @e[tag=symbol,distance=..0.15] run scoreboard players add missed accuracy 1
execute as @e[tag=circle] at @s positioned ~ ~ ~-2 as @e[tag=symbol,distance=..0.15] run kill @s

#Accuracy
scoreboard objectives add accuracy dummy
scoreboard players set pos100 accuracy 100
scoreboard players set note_total accuracy {set_accuracy}

execute if score @p timer < track length run scoreboard players operation Accuracy score = @p accuracy
execute if score @p timer < track length run scoreboard players operation progress accuracy = @p accuracy
execute if score @p timer < track length run scoreboard players operation progress accuracy += missed accuracy
execute if score @p timer < track length run scoreboard players operation Accuracy score *= pos100 accuracy
execute if score @p timer < track length run scoreboard players operation Accuracy score /= progress accuracy
execute if score Accuracy score matches 100 if score missed accuracy matches 1.. run scoreboard players set Accuracy score 99

## Track
function scripts:track

# Position notes
tp @e[tag=pos,tag=green] 2 65 10
tp @e[tag=pos,tag=red] 1 65 10
tp @e[tag=pos,tag=yellow] 0 65 10
tp @e[tag=pos,tag=blue] -1 65 10
tp @e[tag=pos,tag=orange] -2 65 10
tag @e[tag=pos] remove pos

## End
execute if score @p timer = track length run stopsound @p master
execute if score @p timer = track length run summon lightning_bolt 0 63 7
execute if score @p timer = track length run playsound minecraft:ui.toast.challenge_complete master @p
execute if score @p timer = track length run scoreboard players operation @p accuracy *= pos100 accuracy
execute if score @p timer = track length run scoreboard players operation @p accuracy /= note_total accuracy
execute if score @p timer = track length run title @a title {"text":"YOU ROCK","color":"dark_purple"}
execute if score @p timer = track length run title @a subtitle ["",{"text":"Accuracy: ","color":"light_purple"},{"score":{"name":"Accuracy","objective":"score"},"color":"light_purple"},{"text":"%","bold":true,"color":"light_purple"}]


## Extras
execute if score @p start matches 1 run effect clear @e[tag=circle]
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:2} run effect give @e[tag=circle,tag=green] glowing 1 0 true
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:3} run effect give @e[tag=circle,tag=red] glowing 1 0 true
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:4} run effect give @e[tag=circle,tag=yellow] glowing 1 0 true
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:5} run effect give @e[tag=circle,tag=blue] glowing 1 0 true
execute if score @p start matches 1 if data entity @p {SelectedItemSlot:6} run effect give @e[tag=circle,tag=orange] glowing 1 0 true

execute unless entity @e[tag=multiplier] run summon minecraft:armor_stand -4 65.5 5 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1,Tags:["multiplier"],DisabledSlots:4144959,CustomNameVisible:1,CustomName:'{"text":"x1","color":"yellow","bold":"true"}'}
execute if score Streak score matches 0..9 as @e[tag=multiplier] run data merge entity @s {CustomName:'{"text":"x1","color":"yellow","bold":"true"}'}
execute if score Streak score matches 10..19 as @e[tag=multiplier] run data merge entity @s {CustomName:'{"text":"x2","color":"gold","bold":"true"}'}
execute if score Streak score matches 20..29 as @e[tag=multiplier] run data merge entity @s {CustomName:'{"text":"x3","color":"green","bold":"true"}'}
execute if score Streak score matches 30.. as @e[tag=multiplier] run data merge entity @s {CustomName:'{"text":"x4","color":"aqua","bold":"true"}'}

execute if score Streak score matches 0 run fill -3 63 2 -3 63 11 air
execute if score Streak score matches 1 run setblock -3 63 2 redstone_block
execute if score Streak score matches 2 run setblock -3 63 3 redstone_block
execute if score Streak score matches 3 run setblock -3 63 4 redstone_block
execute if score Streak score matches 4 run setblock -3 63 5 redstone_block
execute if score Streak score matches 5 run setblock -3 63 6 redstone_block
execute if score Streak score matches 6 run setblock -3 63 7 redstone_block
execute if score Streak score matches 7 run setblock -3 63 8 redstone_block
execute if score Streak score matches 8 run setblock -3 63 9 redstone_block
execute if score Streak score matches 9 run setblock -3 63 10 redstone_block
execute if score Streak score matches 10 run setblock -3 63 11 redstone_block
execute if score Streak score matches 11 run fill -3 63 2 -3 63 11 air
execute if score Streak score matches 11 run setblock -3 63 2 redstone_block
execute if score Streak score matches 12 run setblock -3 63 3 redstone_block
execute if score Streak score matches 13 run setblock -3 63 4 redstone_block
execute if score Streak score matches 14 run setblock -3 63 5 redstone_block
execute if score Streak score matches 15 run setblock -3 63 6 redstone_block
execute if score Streak score matches 16 run setblock -3 63 7 redstone_block
execute if score Streak score matches 17 run setblock -3 63 8 redstone_block
execute if score Streak score matches 18 run setblock -3 63 9 redstone_block
execute if score Streak score matches 19 run setblock -3 63 10 redstone_block
execute if score Streak score matches 20 run setblock -3 63 11 redstone_block
execute if score Streak score matches 21 run fill -3 63 2 -3 63 11 air
execute if score Streak score matches 21 run setblock -3 63 2 redstone_block
execute if score Streak score matches 22 run setblock -3 63 3 redstone_block
execute if score Streak score matches 23 run setblock -3 63 4 redstone_block
execute if score Streak score matches 24 run setblock -3 63 5 redstone_block
execute if score Streak score matches 25 run setblock -3 63 6 redstone_block
execute if score Streak score matches 26 run setblock -3 63 7 redstone_block
execute if score Streak score matches 27 run setblock -3 63 8 redstone_block
execute if score Streak score matches 28 run setblock -3 63 9 redstone_block
execute if score Streak score matches 29 run setblock -3 63 10 redstone_block
execute if score Streak score matches 30 run setblock -3 63 11 redstone_block


execute if score Streak score matches 0 run fill 3 65 2 3 65 11 air
execute if score Streak score matches 30 run playsound minecraft:block.gilded_blackstone.break master @s ~ ~ ~ 0.5
execute if score Streak score matches 150 run playsound minecraft:entity.lightning_bolt.thunder master @p
execute if score Streak score matches 150 run fill 3 65 2 3 65 11 soul_fire

execute if score Streak score matches 50 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 100 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]}
execute if score Streak score matches 150 run title @p actionbar {"text":"Star Power Ready","color":"aqua","bold":"true"}
execute if score Streak score matches 200 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]}
execute if score Streak score matches 300 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]}
execute if score Streak score matches 400 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 500 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 600 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 700 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 800 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 900 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]
execute if score Streak score matches 1000 run title @p actionbar ["",{"score":{"name":"Streak","objective":"score"},"bold":true,"color":"dark_red"},{"text":" Note Streak!","bold":true,"color":"dark_red"}]


#bossbar add star_power {"text":"Star power"}
#bossbar set star_power max 150
#bossbar set minecraft:star_power style notched_10
#bossbar set minecraft:star_power color blue
execute if score delay delay matches 0 run bossbar set star_power name {"text":"STAR POWER","color":"aqua","bold":"true"}
execute if score delay delay matches 0 run bossbar set star_power players @a
execute if score delay delay matches 0 run execute store result bossbar star_power value run scoreboard players get Streak score