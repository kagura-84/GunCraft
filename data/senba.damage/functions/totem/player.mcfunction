# >damage/player

#必要な物をピックアップ
scoreboard objectives add senbaD.totem dummy

#タグづけ
tag @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] add senba.damage-totem-main
tag @s[tag=!senba.damage-totem-main,nbt={Inventory:[{Slot:-106b,id:"minecraft:totem_of_undying"}]}] add senba.damage-totem-off

#トーテムを一つ減らす
summon armor_stand ~ ~ ~ {Tags:["senba.damage-totem_armor"],Marker:1b,Invisible:1b,Silent:1b}
item replace entity @e[type=armor_stand,tag=senba.damage-totem_armor] armor.head from entity @s[tag=senba.damage-totem-main] weapon.mainhand
item replace entity @e[type=armor_stand,tag=senba.damage-totem_armor] armor.head from entity @s[tag=senba.damage-totem-off ] weapon.offhand
execute as @e[type=armor_stand,tag=senba.damage-totem_armor] store result score @s senbaD.totem run data get entity @s ArmorItems[3].Count
scoreboard players remove @e[type=armor_stand,tag=senba.damage-totem_armor,limit=1] senbaD.totem 1
execute as @e[type=armor_stand,tag=senba.damage-totem_armor] store result entity @s ArmorItems[3].Count float 1 run scoreboard players get @s senbaD.totem
item replace entity @s[tag=senba.damage-totem-main] weapon.mainhand from entity @e[type=armor_stand,tag=senba.damage-totem_armor,limit=1] armor.head
item replace entity @s[tag=senba.damage-totem-off ] weapon.offhand from entity @e[type=armor_stand,tag=senba.damage-totem_armor,limit=1] armor.head

#効果をなるべく再現する
scoreboard players set @s[type=player] ScoreToHealth 1
advancement grant @s only minecraft:adventure/totem_of_undying
playsound item.totem.use player @a ~ ~ ~ 1 1
particle totem_of_undying ~ ~1 ~ 0 0 0 0.5 100
effect clear @s
effect give @s regeneration 45 1 false
effect give @s absorption 5 1 false
effect give @s fire_resistance 40 1 false

#タグを消す
tag @s[tag=senba.damage-totem-main] remove senba.damage-totem-main
tag @s[tag=senba.damage-totem-off ] remove senba.damage-totem-off
kill @e[type=armor_stand,tag=senba.damage-totem_armor]
scoreboard objectives remove senbaD.totem
