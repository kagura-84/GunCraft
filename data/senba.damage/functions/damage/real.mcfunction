# >main

#トーテムを持っていれば死を回避できる
 execute unless data storage senba.damage {use_totem:0b} run tag @s[nbt={HandItems:[{id:"minecraft:totem_of_undying"}]}] add senba.damage-totem

# 準備
 scoreboard objectives add senbaD.health dummy
# ダメージを与える
 execute store result score @s[type=!#senba.damage:ng_type] senbaD.health run data get entity @s Health 100
 scoreboard players operation @s[type=!#senba.damage:ng_type] senbaD.health -= #DAMAGE senbaD.score
 execute if data storage senba.damage owner as @s[scores={senbaD.health=..0},type=!ender_dragon,tag=!senba.damage-totem] run tag @s add senba.damage-killed
 kill @s[scores={senbaD.health=..0},type=!ender_dragon,type=!end_crystal,tag=!senba.damage-killed,tag=!senba.damage-totem]
 execute as @s[type=!#senba.damage:ng_type,type=!end_crystal,tag=!senba.damage-killed] store result entity @s Health float 0.01 run scoreboard players get @s senbaD.health

 #トーテム発動
  #一般派
  execute unless data storage senba.damage {use_totem:2b} as @s[scores={senbaD.health=..0},tag=senba.damage-totem] at @s run function senba.damage:damage/totem
  #面白いので没案をのこす
  execute if data storage senba.damage {use_totem:2b} as @s[scores={senbaD.health=..0},tag=senba.damage-totem] at @s run function senba.damage:totem/other

 #ダメージモーション
 execute unless data storage senba.damage {motion:0b} unless data storage senba.damage owner unless data storage senba.damage {motion:2b} run effect give @s[type=!#senba.damage:ng_type,type=!#senba.damage:undead,tag=!senba.damage-totem] instant_damage 1 31
 execute unless data storage senba.damage {motion:0b} unless data storage senba.damage owner unless data storage senba.damage {motion:2b} run effect give @s[type=#senba.damage:undead,tag=!senba.damage-totem] instant_health 1 31
 execute if entity @s[type=ender_dragon,scores={senbaD.health=1..},nbt={HurtTime:0s}] run function senba.damage:effect/dragon

 #オーナー
 execute if data storage senba.damage owner run function senba.damage:owner/main

#キル&かたずけ
 data modify entity @s[type=!ender_dragon] HurtTime set value 20s
 scoreboard objectives remove senbaD.health
 execute as @s[type=end_crystal] run summon snowball ~ ~-0.31 ~ {Motion:[0d,10d,0d]}
 execute as @s[type=shulker_bullet] run particle crit ~ ~ ~ 0.2 0.2 0.2 1 10
