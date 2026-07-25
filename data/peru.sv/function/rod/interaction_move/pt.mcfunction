#tellraw Asa9 "have"
execute unless entity @e[tag=peru.sv.rod,distance=..3] run summon interaction ~ ~ ~ {width:2f,height:2f,Tags:["peru.sv.rod"]}
tp @e[tag=peru.sv.rod,distance=..3,sort=nearest,limit=1] ~ ~ ~ ~ ~