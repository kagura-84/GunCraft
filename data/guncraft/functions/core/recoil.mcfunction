#> guncraft:core/recoil
#
# リコイル処理
#
# @within function guncraft:core/main

# スコアの値が高ければ高いほど上に向く
    tp @s ^ ^  ^ ~ ~-1
    execute if score @s GunCraft.recoil matches 2.. run tp @s ^ ^ ^ ~ ~-1
    execute if score @s GunCraft.recoil matches 4.. run tp @s ^ ^  ^ ~ ~-1
    execute if score @s GunCraft.recoil matches 2.. run tp @s ^ ^  ^ ~ ~-1
    execute if score @s GunCraft.recoil matches 8.. run tp @s ^ ^  ^ ~ ~-1
    execute if score @s GunCraft.recoil matches 10.. run tp @s ^ ^  ^ ~ ~-1

# スコアの値が高ければ高いほど早く減る
    scoreboard players remove @s GunCraft.recoil 1
    execute if score @s GunCraft.recoil matches 5.. run scoreboard players remove @s GunCraft.recoil 1
    execute if score @s GunCraft.recoil matches 10.. run scoreboard players remove @s GunCraft.recoil 1