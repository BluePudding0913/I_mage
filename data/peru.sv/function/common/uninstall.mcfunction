scoreboard objectives remove peru.sv.lvl
scoreboard objectives remove peru.sv.rod_pos
scoreboard objectives remove peru.sv.uninstall

data remove storage peru.sv: system
data remove storage peru.sv: rod
kill @e[tag=peru.sv.rod.orb]
kill @e[tag=peru.sv.rod.orb_p]
kill @e[tag=peru.sv.rod.mk]

tellraw @a "Impact Wand was uninstalled."
