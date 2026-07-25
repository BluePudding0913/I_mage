advancement revoke @s only peru.sv:rod/r
data remove storage peru.sv: rod
execute if score @s peru.sv.rod.mode matches 1 run function peru.sv:rod/white_impact/main with storage peru.sv: system
execute if score @s peru.sv.rod.mode matches 2 run function peru.sv:rod/cannon/main with storage peru.sv: system
execute if score @s peru.sv.rod.mode matches 3 run function peru.sv:rod/heal/main with storage peru.sv: system

## 終了処理
scoreboard objectives remove peru.sv.rod_pos
