#> guncraft:core/bazooka/shot
#
# bazooka の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.bom"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
        execute as @e[tag=GunCraft.preparation] run function guncraft:core/bazooka/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/heavy_shot

# プレイヤーのスコア設定
    ## リコイル
        scoreboard players set @s GunCraft.recoil 6

    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 40

# 微調整
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~

    ## 拡散
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 0.1f
        execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation] at @s run function guncraft:core/projectile/spread

# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation