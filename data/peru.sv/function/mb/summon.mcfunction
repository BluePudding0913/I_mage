advancement revoke @s only peru.sv:mb/summon
execute store result score @s peru.sv.lvl run data get entity @s XpLevel
execute if score @s peru.sv.lvl matches ..29 run particle minecraft:ash ~ ~0.4 ~ 0.2 0.2 0.2 5 256
execute if score @s peru.sv.lvl matches ..29 run return 0
experience add @s -1395 points


#一個減らす
execute store result score @s peru.sv.sc run data get entity @s Inventory[{Slot:-106b}].count
scoreboard players remove @s peru.sv.sc 1
item modify entity @s weapon.offhand peru.sv:count
execute store result score @s peru.sv.sc run data get entity @s SelectedItem.count
scoreboard players remove @s peru.sv.sc 1
item modify entity @s weapon.mainhand peru.sv:count

#アイテムのsummon
execute store result score # peru.sv.tmp run random value 1..100
data remove storage peru.sv: tmp
execute if score # peru.sv.tmp matches 41..60 run data modify storage peru.sv: tmp set value {sort:1,lr:"Freeze"}
execute if score # peru.sv.tmp matches 1..20 run data modify storage peru.sv: tmp set value {sort:2,lr:"Thunder"}
execute if score # peru.sv.tmp matches 91..95 run data modify storage peru.sv: tmp set value {sort:3,lr:"Return"}
execute if score # peru.sv.tmp matches 21..40 run data modify storage peru.sv: tmp set value {sort:4,lr:"Item_collector"}
execute if score # peru.sv.tmp matches 96..100 run data modify storage peru.sv: tmp set value {sort:5,lr:"protection"}
execute if score # peru.sv.tmp matches 61..63 run data modify storage peru.sv: tmp set value {sort:6,lr:"invincible"}

execute if score # peru.sv.tmp matches 64..90 run data modify storage peru.sv: tmp set value {sort:2,lr:"Thunder"}

function peru.sv:mb/summon_mcr with storage peru.sv: tmp
