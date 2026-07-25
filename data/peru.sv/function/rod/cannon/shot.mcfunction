$summon $(sort) ^ ^ ^3 {NoGravity:1b,Age:5960,Value:0,Motion:[$(a),$(b),$(c)],Tags:["peru.sv.rod.core"],fuse:30,Owner:$(uuid),BlockState:{Name:"$(block)"},Time:1}
execute positioned ^ ^ ^3 as @e[type=falling_block,distance=..1] run data modify entity @s NoGravity set value false
execute positioned ^ ^ ^3 as @e[type=arrow,distance=..1] run data modify entity @s NoGravity set value false

#一個減らす
execute store result score @s peru.sv.sc run data get entity @s Inventory[{Slot:-106b}].count
scoreboard players remove @s peru.sv.sc 1
execute if predicate peru.sv:offhand_water run item replace entity @s weapon.offhand with bucket
execute if predicate peru.sv:offhand_bucket run return 0
item modify entity @s weapon.offhand peru.sv:count
