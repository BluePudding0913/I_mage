execute if score @s peru.sv.uninstall matches 1.. run function peru.sv:common/uninstall
scoreboard players enable @s peru.sv.uninstall

# 進捗解除
advancement revoke @s only peru.sv:player_tick
