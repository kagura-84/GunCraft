#> guncraft:core/lazer_hand_gun/shot
#
# lazer_hand_gun の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.light"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/lazer_hand_gun/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/light_shot

# プレイヤーのスコア設定
    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 4
        execute if score @s GunCraft.sneak matches 1.. run scoreboard players add @s GunCraft.cool_time 6

# 微調整
    tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~

    ## 拡散
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 0.5f
        execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation] at @s run function guncraft:core/projectile/spread

# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation