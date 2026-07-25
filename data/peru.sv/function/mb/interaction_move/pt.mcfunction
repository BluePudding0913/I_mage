#tellraw Asa9 "have"
execute unless entity @e[tag=peru.sv.mb,distance=..3] run summon interaction ~ ~ ~ {width:2f,height:2f,Tags:["peru.sv.mb"]}
tp @e[tag=peru.sv.mb,distance=..3,sort=nearest,limit=1] ~ ~ ~ ~ ~