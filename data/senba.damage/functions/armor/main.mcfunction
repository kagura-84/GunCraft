# >main


#  <今から計算していく計算式>
#
# (防御力-(ダメージ÷(2+防具強度÷4)))÷25=軽減率

#計算に必要な物を作る
 scoreboard players set $-1 senbaD.score -1
 scoreboard players set $25 senbaD.score 25
 scoreboard players set $200 senbaD.score 200
 scoreboard players set $10000 senbaD.score 10000
 #防御率カット
  execute store result score #senba.damage-armor senbaD.score run data get storage senba.damage armor_rate
  scoreboard players operation #senba.damage-armor senbaD.score *= $-1 senbaD.score
  scoreboard players operation #senba.damage-armor senbaD.score += $100 senbaD.score
  #値が異常だった場合に適当な値に引き戻す
  execute if score #senba.damage-armor senbaD.score matches ..-1 run scoreboard players set #senba.damage-armor senbaD.score 0
  execute if score #senba.damage-armor senbaD.score matches 100.. run scoreboard players set #senba.damage-armor senbaD.score 100
  execute if score #senba.damage-armor senbaD.score matches 101 run scoreboard players set #senba.damage-armor senbaD.score 100

#　防具チェック
 #ダメージ軽減
  #計算
   execute if entity @s[type=player,nbt={Inventory:[{tag:{Enchantments:[{id:"minecraft:protection"}]}}]}] run function senba.damage:armor/plyer
   execute if entity @s[type=!player,nbt={ArmorItems:[{tag:{Enchantments:[{id:"minecraft:protection"}]}}]}] run function senba.damage:armor/other
  #計算
   scoreboard players set #ダメージ軽減 senbaD.score 100
   scoreboard players operation #ダメージ軽減 senbaD.score -= #senba.damage-armorH senbaD.score
 #防御力
  execute store result score #防御力 senbaD.score run attribute @s minecraft:generic.armor get 10000
 #防具耐久 (防具強度 ÷ 4)
  execute store result score #防具強度 senbaD.score run attribute @s minecraft:generic.armor_toughness get 25
 #カットを適用
  scoreboard players operation #防御力 senbaD.score *= #senba.damage-armor senbaD.score
  scoreboard players operation #防御力 senbaD.score /= $100 senbaD.score
  scoreboard players operation #防具強度 senbaD.score *= #senba.damage-armor senbaD.score
  scoreboard players operation #防具強度 senbaD.score /= $100 senbaD.score


#　計算
 #(2 + (防具強度 ÷ 4))
 scoreboard players operation #防具強度 senbaD.score += $200 senbaD.score
 #(ダメージ ÷ ())
 scoreboard players operation #DAMAGE senbaD.score *= $100 senbaD.score
 scoreboard players operation #DAMAGE senbaD.score /= #防具強度 senbaD.score
 #(防御力 – ()) 
 scoreboard players operation #防御力 senbaD.score -= #DAMAGE senbaD.score
 #() ÷ 25
 scoreboard players operation #防御力 senbaD.score /= $25 senbaD.score
 execute if score #防御力 senbaD.score matches ..0 run scoreboard players set #防御力 senbaD.score 0
 #後仕上げ
 scoreboard players operation #防御力 senbaD.score /= $100 senbaD.score
 scoreboard players set @s senbaD.score 100
 scoreboard players operation @s senbaD.score -= #防御力 senbaD.score
 execute store result score #DAMAGE senbaD.score run scoreboard players get #damage senbaD.score
 scoreboard players operation #DAMAGE senbaD.score *= @s senbaD.score
 #エンチャのダメージ軽減
  scoreboard players operation #DAMAGE senbaD.score *= #ダメージ軽減 senbaD.score
  scoreboard players operation #DAMAGE senbaD.score /= $10000 senbaD.score

#  <計算式>
#
# ( 防御力-(ダメージ÷(2+防具強度÷4)))÷25=軽減率

