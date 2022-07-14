
#与えるダメージか体力が無くなるまでパーティクルを表示しながらループ
execute if score #particle senbaD.score matches 1.. if score #DAMAGE senbaD.score matches 099.. at @s anchored eyes positioned ^ ^ ^ if data storage senba.damage {hurt_particle:1b} run particle damage_indicator ~ ~-0.7 ~ 0.2 0.2 0.2 0 1
execute if score #particle senbaD.score matches 1.. if score #DAMAGE senbaD.score matches 099.. at @s anchored eyes positioned ^ ^ ^ if data storage senba.damage {blood_particle:1b} run particle block red_wool ~ ~-0.6 ~ 0.05 0.05 0.05 0 3
scoreboard players remove #particle senbaD.score 1
scoreboard players remove #DAMAGE senbaD.score 100
execute if score #particle senbaD.score matches 1.. if score #DAMAGE senbaD.score matches 100.. at @s run function senba.damage:particle/main
