#white_impact
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:dust{color:16777215,scale:0.7} ~ ~ ~ 0.3 0.3 0.3 0 64
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:flash{color:16777215} ~ ~ ~ 0.01 0.01 0.01 0 1
execute as @e[tag=peru.sv.rod.orb] at @s positioned ~-0.25 ~-0.25 ~-0.25 as @e[dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run damage @s[type=!player,type=!experience_orb] 50 magic by @p
execute as @e[tag=peru.sv.rod.orb] at @s unless entity @e[tag=peru.sv.rod.orb_p,distance=..3] run kill @s

#cannon
#execute as @e[tag=peru.sv.rod.core] at @s run particle minecraft:flash ~ ~ ~ 0 0 0 0 1
execute as @e[tag=peru.sv.rod.core,type=experience_orb] at @s as @e[distance=..3,type=!item_frame] run data modify entity @s Motion set from entity @e[tag=peru.sv.rod.core,sort=nearest,limit=1] Motion

#magic_book
function peru.sv:mb/interaction_move/t

#freeze
execute as @e[tag=peru.sv.mb.noai] store result score @s peru.sv.tmp run function peru.sv:mb/run/freeze/onai

#function peru.sv:rod/interaction_move/t
#execute as @e[tag=peru.sv.brb] at @s run function peru.sv:bedrock_breaker/spawn
