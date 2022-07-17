#> score_damage:core/get_status
#
# 計算に必要なMobの情報を取得する
#
# @within function score_damage:core/attack

# HP
    execute store result score $Health ScoreDamageCore run data get entity @s Health 10000
# 防御力
    execute if data storage score_damage: Argument{BypassArmor:0b} store result score $DefensePoints ScoreDamageCore run attribute @s generic.armor get 100
# 防具強度
    execute if data storage score_damage: Argument{BypassArmor:0b} store result score $Toughness ScoreDamageCore run attribute @s generic.armor_toughness get 100
# EPFが未設定または-1以下の時Protectionを参照
    function score_damage:core/get_default_epf/
# 耐性エフェクト
    scoreboard players set $Resistance ScoreDamageCore 0