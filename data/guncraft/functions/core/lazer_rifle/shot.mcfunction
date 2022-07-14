#> guncraft:core/lazer_rifle/shot
#
# rifleの発射処理
#
# @within function guncraft:core/tick

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.light"]}
    scoreboard players operation @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] GunCraft.PlayerID = @s GunCraft.PlayerID
    execute at @s run function guncraft:core/sounds/photon_shot

# 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/lazer_rifle/projectile_set

# 微調整
    scoreboard players set @s GunCraft.cool_time 50
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] ^ ^ ^0.5 ~ ~
    execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation,limit=1] at @s run function guncraft:core/lazer_rifle/spread
    tag @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] remove GunCraft.preparation