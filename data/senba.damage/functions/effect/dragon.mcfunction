# >damage/other

#ドラゴンにゴリ押しでダメージモーションを与える
execute if block ~ ~-1 ~ #senba.damage:air run summon arrow ~ ~-0.5 ~ {Motion:[0d,10d,0d],Tags:[senba.born],damage:0.1,life:1200,Silent:1b}
#オーナーがないと当らないらしい
data modify entity @e[type=arrow,tag=senba.born,limit=1] Owner set from entity @p UUID
#タグ除去
tag @e[type=arrow,distance=..5,tag=senba.born] remove senba.born

#矢で体力が減るだろうから私の優しさで回復させてあげる
execute store result score @s senbaD.health run data get entity @s Health 100
execute if block ~ ~-1 ~ #senba.damage:air run scoreboard players add @s senbaD.health 125
execute if block ~ ~-1 ~ #senba.damage:air store result entity @s Health float 0.01 run scoreboard players get @s senbaD.health

#エンドラの悲鳴
execute unless block ~ ~-1 ~ #senba.damage:air run playsound entity.ender_dragon.hurt hostile @a ~ ~ ~ 5 1
execute unless block ~ ~-1 ~ #senba.damage:air run data modify entity @s HurtTime set value 20s
