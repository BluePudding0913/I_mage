advancement revoke @s only peru.sv:xp_apple/summon

#総ポイントを計算
scoreboard objectives add peru.sv.calc_p dummy
function peru.sv:xp_apple/loop
execute store result storage peru.sv: apple.p int 1 run scoreboard players get #s peru.sv.calc_p
scoreboard objectives remove peru.sv.calc_p

#一個減らす
execute store result score @s peru.sv.sc run data get entity @s SelectedItem.count
scoreboard players remove @s peru.sv.sc 1
item modify entity @s weapon.mainhand peru.sv:count

#アイテムのsummonと後処理、演出
execute anchored eyes run function peru.sv:xp_apple/item_sum with storage peru.sv: apple
data remove storage peru.sv: apple
