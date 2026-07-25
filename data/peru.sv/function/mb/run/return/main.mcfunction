data remove storage peru.sv: tmp
execute store result storage peru.sv: tmp.x int 1 run data get entity @s LastDeathLocation.pos[0]
execute store result storage peru.sv: tmp.y int 1 run data get entity @s LastDeathLocation.pos[1]
execute store result storage peru.sv: tmp.z int 1 run data get entity @s LastDeathLocation.pos[2]
data modify storage peru.sv: tmp.dim set from entity @s LastDeathLocation.dimension
function peru.sv:mb/run/return/tp with storage peru.sv: tmp