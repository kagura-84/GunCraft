# >main

#トーテムを持っていれば死を回避できる
execute unless data storage senba.damage {use_totem:0b} run tag @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] add senba.damage-totem
execute unless data storage senba.damage {use_totem:0b} run tag @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:totem_of_undying"}]}] add senba.damage-totem


#赤石愛さんのデータパックを前提とし､ダメージを与える
# ゲームルールを変更する準備
 execute store result storage senba.damage showDeathMessages byte 1 run gamerule showDeathMessages
# 計算
 execute unless score @s ScoreToHealth matches 1.. store result score @s ScoreToHealth run data get entity @s Health 100
 scoreboard players operation @s ScoreToHealth -= #DAMAGE senbaD.score
 scoreboard players set @s[scores={ScoreToHealth=..99}] ScoreToHealth 1

 gamerule showDeathMessages false
 execute as @s[scores={ScoreToHealth=..99},tag=!senba.damage-totem] unless data storage senba.damage {player_motion:0b} if data storage senba.damage {showDeathMessages:1b} run tellraw @a [{"selector":"@s"},{"text":"は"},{"selector":"@a[tag=attack_player]"}]
 kill @s[scores={ScoreToHealth=..99},tag=!senba.damage-totem]
 #トーテム発動
  #一般派
  execute unless data storage senba.damage {use_totem:2b} as @s[scores={ScoreToHealth=..99},tag=senba.damage-totem] at @s run function senba.damage:damage/totem
  #面白いので没案をのこす
  execute if data storage senba.damage {use_totem:2b} as @s[scores={ScoreToHealth=..99},tag=senba.damage-totem] at @s run function senba.damage:totem/player
# お片付け&その他
 execute as @s[scores={ScoreToHealth=100..}] unless data storage senba.damage {motion:2b} unless data storage senba.damage {motion:3b} run function senba.damage:effect/hurt
 execute if data storage senba.damage {showDeathMessages:1b} run gamerule showDeathMessages true
 data remove storage senba.damage showDeathMessages
