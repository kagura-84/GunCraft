#> guncraft:core/scope_rifle/shot
#
# scope_rifle の発射処理
#
# @within function guncraft:core/projectile/trigger

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation"]}
    scoreboard players operation @e[tag=GunCraft.preparation,limit=1] GunCraft.PlayerID = @s GunCraft.PlayerID

    ## 弾丸の性能設定
        execute as @e[tag=GunCraft.preparation] run function guncraft:core/scope_rifle/projectile_set

# 発射音
    execute at @s run function guncraft:core/sounds/heavy_shot

# プレイヤーのスコア設定
    ## リコイル
        scoreboard players set @s GunCraft.recoil 8

    ## クールタイム
        scoreboard players set @s GunCraft.cool_time 40

# 微調整
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~

# tag削除
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation