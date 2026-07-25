advancement revoke @s only peru.sv:mb/r
execute store result score #sort peru.sv.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".peru_sv_mb_sort

execute store result score @s peru.sv.sc run data get entity @s SelectedItem.count
scoreboard players remove @s peru.sv.sc 1
item modify entity @s weapon.mainhand peru.sv:count

execute if score #sort peru.sv.tmp matches 1 run function peru.sv:mb/run/freeze/main
execute if score #sort peru.sv.tmp matches 2 run function peru.sv:mb/run/thunder/main
execute if score #sort peru.sv.tmp matches 3 run function peru.sv:mb/run/return/main
execute if score #sort peru.sv.tmp matches 4 run function peru.sv:mb/run/collector/main
execute if score #sort peru.sv.tmp matches 5 run function peru.sv:mb/run/protection/main
execute if score #sort peru.sv.tmp matches 6 run function peru.sv:mb/run/inv/main
