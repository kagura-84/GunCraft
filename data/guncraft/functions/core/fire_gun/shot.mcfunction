#> guncraft:core/fire_gun/shot
#
# dire_gun の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.fire"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
        execute as @e[tag=GunCraft.preparation] run function guncraft:core/fire_gun/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/normal_shot

# プレイヤーのスコア設定
    ## リコイル
        scoreboard players set @s GunCraft.recoil 6
        execute if predicate guncraft:flag/sneaking run scoreboard players set @s GunCraft.recoil 5

    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 4
        execute if score @s GunCraft.sneak matches 1.. run scoreboard players add @s GunCraft.cool_time 2

# 微調整
    tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~

    ## 拡散
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 0.8f
        execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation] at @s run function guncraft:core/projectile/spread
    
# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation