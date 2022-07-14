# >damage/other

#必要な物をピックアップ
scoreboard objectives add senbaD.totem dummy

#タグづけ
summon armor_stand ~ ~ ~ {Tags:["senba.damage-totem_armor"],Marker:1b,Invisible:1b,Silent:1b}
item replace entity @e[type=armor_stand,tag=senba.damage-totem_armor] armor.head from entity @s weapon.mainhand
execute if entity @e[type=armor_stand,tag=senba.damage-totem_armor,nbt={ArmorItems:[{},{},{},{id:"minecraft:totem_of_undying"}]}] run tag @s add senba.damage-totem-main
item replace entity @e[type=armor_stand,tag=senba.damage-totem_armor] armor.head from entity @s weapon.offhand
execute if entity @e[type=armor_stand,tag=senba.damage-totem_armor,nbt={ArmorItems:[{},{},{},{id:"minecraft:totem_of_undying"}]}] run tag @s[tag=!senba.damage-totem-main] add senba.damage-totem-off
kill @e[type=armor_stand,tag=senba.damage-totem_armor]

#トーテムを一つ減らす
execute as @s[tag=senba.damage-totem-main] store result score @s senbaD.totem run data get entity @s HandItems[0].Count
execute as @s[tag=senba.damage-totem-off] store result score @s senbaD.totem run data get entity @s HandItems[1].Count
scoreboard players remove @s senbaD.totem 1
execute as @s[tag=senba.damage-totem-main] store result entity @s HandItems[0].Count byte 1 run scoreboard players get @s senbaD.totem
execute as @s[tag=senba.damage-totem-off] store result entity @s HandItems[1].Count byte 1 run scoreboard players get @s senbaD.totem

#効果をなるべく再現する
playsound item.totem.use player @a ~ ~ ~ 1 1
particle totem_of_undying ~ ~1 ~ 0 0 0 0.5 100
effect clear @s
effect give @s regeneration 45 1 false
effect give @s absorption 5 1 false
effect give @s fire_resistance 40 1 false

#タグを消す
tag @s[tag=senba.damage-totem-main] remove senba.damage-totem-main
tag @s[tag=senba.damage-totem-off] remove senba.damage-totem-off
scoreboard objectives remove senbaD.totem
scoreboard objectives remove senbaD.totem
