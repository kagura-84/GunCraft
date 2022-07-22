#> guncraft:core/score_get
#
# playerのscoreとnbtを取得
#
# @within function guncraft:core/tick

#> temp
# @private
    #declare score_holder $slot プレイヤーが1tick前に選択していたスロット

# PlayerIDが設定されてなければ設定
    execute unless score @s GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players add $Global GunCraft.PlayerID 1
    execute unless score @s GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players operation @s GunCraft.PlayerID = $Global GunCraft.PlayerID

# 1tick前からスロットが変わったか
    scoreboard players operation $slot GunCraft.slot = @s GunCraft.slot
    execute store result score @s GunCraft.slot run data get entity @s SelectedItemSlot
    execute unless score $slot GunCraft.slot = @s GunCraft.slot run function guncraft:core/cool_set