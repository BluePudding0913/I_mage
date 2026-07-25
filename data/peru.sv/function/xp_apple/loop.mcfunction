execute store result score # peru.sv.calc_p run xp query @s points
xp set @s 0 points
xp add @s -1 points
scoreboard players add # peru.sv.calc_p 1
scoreboard players operation #s peru.sv.calc_p += # peru.sv.calc_p

#減らしおわってたら、つまりポイントが０であればループ終了(-1の調整もしてある)
execute store result score # peru.sv.calc_p run xp query @s points
execute if score # peru.sv.calc_p matches 0 run scoreboard players remove #s peru.sv.calc_p 1
execute if score # peru.sv.calc_p matches 0 run return 0

#減らしおわってなければ、つまりポイントが０でなければループ
execute if score # peru.sv.calc_p matches 1.. run function peru.sv:xp_apple/loop