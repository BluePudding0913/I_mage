tag @a remove peru.sv.rod.caster
scoreboard players set #owner peru.sv.id 0
scoreboard players operation #owner peru.sv.id = @s peru.sv.id
execute unless score #owner peru.sv.id matches 1.. run return 0
execute as @a if score @s peru.sv.id = #owner peru.sv.id run tag @s add peru.sv.rod.caster
execute if entity @a[tag=peru.sv.rod.caster,limit=1] positioned ~-0.25 ~-0.25 ~-0.25 as @e[dx=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] run damage @s[type=!player,type=!experience_orb] 50 magic by @a[tag=peru.sv.rod.caster,limit=1]
tag @a remove peru.sv.rod.caster
