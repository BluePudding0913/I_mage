data modify storage peru.sv: system set value {impact_xp:40,impact_rq_lvl:3,impact_power:3}

kill @e[tag=peru.sv.rod.orb]
kill @e[tag=peru.sv.rod.orb_p]
kill @e[tag=peru.sv.rod.mk]

scoreboard objectives add peru.sv.lvl dummy
scoreboard objectives add peru.sv.rod_pos dummy
scoreboard objectives add peru.sv.uninstall trigger "Uninstall"
scoreboard players enable @a peru.sv.uninstall

say loaded Impact Wand
