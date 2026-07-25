advancement revoke @s only peru.sv:rod/l
execute if score @s peru.sv.rod.mode matches 1..3 run scoreboard players add @s peru.sv.rod.mode 1
execute if score @s peru.sv.rod.mode matches 4 run scoreboard players set @s peru.sv.rod.mode 1
execute if score @s peru.sv.rod.mode matches 1 run title @s actionbar {"text":"white_impact","color":"white","italic":false}
execute if score @s peru.sv.rod.mode matches 2 run title @s actionbar {"text":"cannon","color":"#FF6600","italic":false}
execute if score @s peru.sv.rod.mode matches 3 run title @s actionbar {"text":"heal","color":"#00FF5E","italic":false}