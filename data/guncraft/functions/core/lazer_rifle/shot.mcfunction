#> guncraft:core/lazer_rifle/shot
#
# lazer_rifle の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.light"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/lazer_rifle/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/photon_shot

# プレイヤーのスコア設定
    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 50

# 微調整
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~

    ## 拡散
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 1.0f
        execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation] at @s run function guncraft:core/projectile/spread

# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation