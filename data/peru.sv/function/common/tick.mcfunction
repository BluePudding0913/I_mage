execute unless data storage peru.sv: system run return 0
execute as @a unless score @s peru.sv.id matches 1.. run function peru.sv:common/register_player
scoreboard players enable @a peru.sv.uninstall
scoreboard players remove @a[scores={peru.sv.rod_cd=1..}] peru.sv.rod_cd 1
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:dust{color:16777215,scale:0.7} ~ ~ ~ 0.3 0.3 0.3 0 64
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:flash{color:16777215} ~ ~ ~ 0.01 0.01 0.01 0 1
execute as @e[tag=peru.sv.rod.orb] at @s run function peru.sv:rod/impact_orb_tick
execute as @e[tag=peru.sv.rod.orb] at @s unless entity @e[tag=peru.sv.rod.orb_p,distance=..3] run kill @s
execute as @a[scores={peru.sv.uninstall=1..},limit=1] run function peru.sv:common/uninstall
