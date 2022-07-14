# >main

# (防御力 – (ダメージ ÷ (2 + 防具強度 ÷ 4))) ÷ 25
 scoreboard players set #senba.damage-effect senbaD.score 100
# エフェクト確認
 execute if entity @s[nbt={ActiveEffects:[{Id:11b,Amplifier:0b}]}] run scoreboard players set #senba.damage-effect senbaD.score 20
 execute if entity @s[nbt={ActiveEffects:[{Id:11b,Amplifier:1b}]}] run scoreboard players set #senba.damage-effect senbaD.score 40
 execute if entity @s[nbt={ActiveEffects:[{Id:11b,Amplifier:2b}]}] run scoreboard players set #senba.damage-effect senbaD.score 60
 execute if entity @s[nbt={ActiveEffects:[{Id:11b,Amplifier:3b}]}] run scoreboard players set #senba.damage-effect senbaD.score 80

#防御率カット
  execute store result score #senba.damage-effect_rate senbaD.score run data get storage senba.damage effect_rate
  scoreboard players operation #senba.damage-effect_rate senbaD.score *= $-1 senbaD.score
  scoreboard players operation #senba.damage-effect_rate senbaD.score += $100 senbaD.score
  #値が異常だった場合に適当な値に引き戻す
  execute if score #senba.damage-effect_rate senbaD.score matches ..-1 run scoreboard players set #senba.damage-effect_rate senbaD.score 0
  execute if score #senba.damage-effect_rate senbaD.score matches 101.. run scoreboard players set #senba.damage-effect_rate senbaD.score 100
  #防具に適用
  scoreboard players operation #senba.damage-effect senbaD.score *= #senba.damage-effect_rate senbaD.score
  scoreboard players operation #senba.damage-effect senbaD.score /= $100 senbaD.score
# エフェクト反映
 #後仕上げ
  scoreboard players operation #senba.damage-effect senbaD.score *= $-1 senbaD.score
  scoreboard players operation #senba.damage-effect senbaD.score += $100 senbaD.score
 #ダメージを決定
 scoreboard players operation #DAMAGE senbaD.score *= #senba.damage-effect senbaD.score
 scoreboard players operation #DAMAGE senbaD.score /= $100 senbaD.score
 
