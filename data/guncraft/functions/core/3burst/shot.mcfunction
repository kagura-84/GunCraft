#> guncraft:core/3burst/shot
#
# 3burst の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
        execute as @e[tag=GunCraft.preparation] run function guncraft:core/3burst/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/light_shot

# プレイヤーのスコア設定
    ## リコイル
        scoreboard players set @s GunCraft.recoil 6
        execute if predicate guncraft:flag/sneaking run scoreboard players set @s GunCraft.recoil 4

    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 6

# 微調整
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~
    
    ## 拡散
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 1.0f
        execute as @e[tag=GunCraft.preparation] at @s run function guncraft:core/projectile/spread

# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation

# 再帰
    scoreboard players remove @s GunCraft.recursion 1
    execute if score @s GunCraft.recursion matches 1.. run function guncraft:core/3burst/shot