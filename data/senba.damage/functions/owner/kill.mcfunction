# >damage/player


#雪玉キル
kill @e[type=snowball]

#ノックバック耐性を戻す
execute as @e[tag=senba.damage-after] run attribute @s minecraft:generic.knockback_resistance modifier remove 85c48b3d-1671-4206-b1be-3a95a14d7e62

#雪玉が当らなかったとき用のダメージモーション
effect give @e[tag=senba.damage-after] instant_health 1 31 true
effect give @e[tag=senba.damage-after] instant_damage 1 31 true
kill @e[type=!player,tag=senba.damage-killed]

#お疲れ様､タグを外す
tag @e[tag=senba.damage-after] remove senba.damage-after
