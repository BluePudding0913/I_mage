

tag @e[tag=peru.sv.rod] remove peru.sv.rod.live
execute as @a at @s anchored eyes positioned ^ ^-0.8 ^1 run tag @e[distance=..3,tag=peru.sv.rod] add peru.sv.rod.live
#kill @e[tag=peru.sv.rod,tag=!peru.sv.rod.live]
execute as @a at @s if predicate peru.sv:rod/have anchored eyes positioned ^ ^-0.8 ^1 run function peru.sv:rod/interaction_move/pt
execute as @a at @s unless predicate peru.sv:rod/have anchored eyes positioned ^ ^-0.8 ^1 run kill @e[tag=peru.sv.rod,distance=..3.5]
#execute as @a at @s unless predicate peru.sv:rod/have anchored eyes positioned ^ ^-0.8 ^1 run tellraw Asa9 "dnt have"