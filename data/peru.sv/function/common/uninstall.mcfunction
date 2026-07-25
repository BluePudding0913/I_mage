scoreboard objectives remove peru.sv.sc
scoreboard objectives remove peru.sv.tmp
scoreboard objectives remove peru.sv.rod.mode
scoreboard objectives remove peru.sv.lvl

data remove storage peru.sv: apple
data remove storage peru.sv: egg
data remove storage peru.sv: tmp
kill @e[tag=peru.sv.egg.empty]
kill @e[tag=peru.sv.egg.filled]
kill @e[tag=peru.sv.egg.got]
kill @e[tag=peru.sv.egg.spawn]
kill @e[tag=peru.sv.rod]
scoreboard objectives remove peru.sv.uninstall
tellraw @a "I_mage was uninstalled."