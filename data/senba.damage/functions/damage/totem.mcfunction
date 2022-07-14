# >damage/other

#トーテム使用後はエフェクトがクリアーされる｡
effect clear @s
effect give @s[type=#senba.damage:undead ,nbt={HurtTime:0s}] instant_health 1 28 true
effect give @s[type=!#senba.damage:undead,nbt={HurtTime:0s}] instant_damage 1 28 true

#ヘルス挽回
scoreboard players set @s[type=player] ScoreToHealth 99
data modify entity @s[type=!player] Health set value 100f

#
execute as @s[nbt=!{HurtTime:0s},type=player ] unless data storage senba.damage {use_totem:3b} run function senba.damage:totem/player
execute as @s[nbt=!{HurtTime:0s},type=!player] unless data storage senba.damage {use_totem:3b} run function senba.damage:totem/other

 #ストレージ回収
  data remove storage senba.damage use_totem