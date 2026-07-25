##ストレージ設定
data modify storage peru.sv: system set value {impact_xp:40,impact_rq_lvl:3,impact_power:3,heal_xp:100,heal_rq_lvl:7}


kill @e[tag=peru.sv.rod]
kill @e[tag=peru.sv.rod.core]

scoreboard objectives add peru.sv.sc dummy
scoreboard objectives add peru.sv.tmp dummy
scoreboard objectives add peru.sv.rod.mode dummy
scoreboard players set @a peru.sv.rod.mode 1
scoreboard objectives add peru.sv.lvl dummy
scoreboard objectives add peru.sv.uninstall trigger "Uninstall"
scoreboard players enable @a peru.sv.uninstall

say loaded I_mage
