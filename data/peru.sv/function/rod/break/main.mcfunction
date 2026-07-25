## break
execute store result score @s peru.sv.lvl run data get entity @s XpLevel
execute if score @s peru.sv.lvl matches ..1 run return 0
experience add @s -10 points
execute anchored feet run summon marker ^ ^ ^4 {Tags:["peru.sv.rod.mk"]}
data remove storage peru.sv: rod
data modify storage peru.sv: rod.pos1 set from entity @s Pos
data modify storage peru.sv: rod.pos2 set from entity @e[tag=peru.sv.rod.mk,limit=1,sort=nearest] Pos
scoreboard objectives add peru.sv.rod_pos dummy
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[0] 100
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[0] 100
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.a double 0.01 run scoreboard players get #o peru.sv.rod_pos
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[1] 100
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[1] 100
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.b double 0.01 run scoreboard players get #o peru.sv.rod_pos
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[2] 100
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[2] 100
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.c double 0.01 run scoreboard players get #o peru.sv.rod_pos
kill @e[tag=peru.sv.rod.mk]

data modify storage peru.sv: rod.pos3.uuid set from entity @s UUID
execute anchored eyes run function peru.sv:rod/break/shot with storage peru.sv: rod.pos3
playsound entity.zombie_villager.converted master @a ~ ~ ~