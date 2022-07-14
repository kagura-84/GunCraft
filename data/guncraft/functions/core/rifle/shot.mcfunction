#> guncraft:core/rifle/shot
#
# rifleの発射処理
#
# @within function guncraft:core/tick

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation"]}
    scoreboard players operation @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] GunCraft.PlayerID = @s GunCraft.PlayerID
    execute at @s run function guncraft:core/sounds/heavy_shot

# 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/rifle/projectile_set
    scoreboard players set @s GunCraft.recoil 15
    execute if predicate guncraft:flag/sneaking run scoreboard players set @s GunCraft.recoil 8

# 微調整
    scoreboard players set @s GunCraft.cool_time 20
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] ^ ^ ^0.5 ~ ~
    execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation,limit=1] at @s run function guncraft:core/rifle/spread
    tag @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] remove GunCraft.preparation