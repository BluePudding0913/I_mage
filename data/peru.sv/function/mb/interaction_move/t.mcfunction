
execute as @a at @s if predicate peru.sv:mb/have anchored eyes positioned ^ ^-0.8 ^1 run function peru.sv:mb/interaction_move/pt
execute as @a at @s unless predicate peru.sv:mb/have anchored eyes positioned ^ ^-0.8 ^1 run kill @e[tag=peru.sv.mb,distance=..3.5]
