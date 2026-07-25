## レーザー
execute store result score @s peru.sv.lvl run data get entity @s XpLevel
$execute if score @s peru.sv.lvl matches ..$(impact_rq_lvl) run particle minecraft:ash ~ ~1.5 ~ 0.2 0.2 0.2 5 8
$execute if score @s peru.sv.lvl matches ..$(impact_rq_lvl) run return 0
$experience add @s -$(impact_xp) points
$execute anchored feet run summon marker ^ ^ ^$(impact_power) {Tags:["peru.sv.rod.mk"]}
data remove storage peru.sv: rod
data modify storage peru.sv: rod.pos1 set from entity @s Pos
data modify storage peru.sv: rod.pos2 set from entity @e[tag=peru.sv.rod.mk,limit=1,sort=nearest] Pos
scoreboard objectives add peru.sv.rod_pos dummy
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[0] 1000
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[0] 1000
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.a double 0.001 run scoreboard players get #o peru.sv.rod_pos
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[1] 1000
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[1] 1000
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.b double 0.001 run scoreboard players get #o peru.sv.rod_pos
execute store result score #p peru.sv.rod_pos run data get storage peru.sv: rod.pos1[2] 1000
execute store result score #o peru.sv.rod_pos run data get storage peru.sv: rod.pos2[2] 1000
scoreboard players operation #o peru.sv.rod_pos -= #p peru.sv.rod_pos
execute store result storage peru.sv: rod.pos3.c double 0.001 run scoreboard players get #o peru.sv.rod_pos
kill @e[tag=peru.sv.rod.mk]
execute anchored eyes run function peru.sv:rod/white_impact/shot with storage peru.sv: rod.pos3
playsound entity.zombie_villager.converted master @a ~ ~ ~