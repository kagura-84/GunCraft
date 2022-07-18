#> guncraft:core/score_get
#
# playerのscoreとnbtを取得
#
# @within function guncraft:core/tick

# PlayerIDが設定されてなければ設定
    execute unless score @s GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players add $Global GunCraft.PlayerID 1
    execute unless score @s GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players operation @s GunCraft.PlayerID = $Global GunCraft.PlayerID