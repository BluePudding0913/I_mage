scoreboard players remove @a[scores={peru.sv.rod_cd=1..}] peru.sv.rod_cd 1
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:dust{color:16777215,scale:0.7} ~ ~ ~ 0.3 0.3 0.3 0 64
execute as @e[tag=peru.sv.rod.orb_p] at @s run particle minecraft:flash{color:16777215} ~ ~ ~ 0.01 0.01 0.01 0 1
execute as @e[tag=peru.sv.rod.orb] at @s positioned ~-0.25 ~-0.25 ~-0.25 as @e[dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run damage @s[type=!player,type=!experience_orb] 50 magic by @p
execute as @e[tag=peru.sv.rod.orb] at @s unless entity @e[tag=peru.sv.rod.orb_p,distance=..3] run kill @s
