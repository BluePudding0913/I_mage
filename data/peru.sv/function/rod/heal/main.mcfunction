## heal
execute store result score @s peru.sv.lvl run data get entity @s XpLevel
$execute if score @s peru.sv.lvl matches ..$(heal_rq_lvl) run particle minecraft:ash ~ ~1.5 ~ 0.2 0.2 0.2 5 256
$execute if score @s peru.sv.lvl matches ..$(heal_rq_lvl) run return 0
$experience add @s -$(heal_xp) points
effect give @s instant_health 1 6 true
effect give @s saturation 1 19 true

playsound entity.zombie_villager.converted master @a ~ ~ ~