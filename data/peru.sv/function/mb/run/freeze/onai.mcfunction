execute store result score @s peru.sv.tmp run data get entity @s PortalCooldown 1
execute if score @s peru.sv.tmp matches 0 run data modify entity @s NoAI set value false
execute if score @s peru.sv.tmp matches 0 run tag @s remove peru.sv.mb.noai
execute if score @s peru.sv.tmp matches 0 run particle minecraft:smoke ~ ~ ~
