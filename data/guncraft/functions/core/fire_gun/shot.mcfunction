#> guncraft:core/fire_gun/shot
#
# hand_gunの発射処理
#
# @within function guncraft:core/tick

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation","GunCraft.fire"]}
    scoreboard players operation @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] GunCraft.PlayerID = @s GunCraft.PlayerID
    execute at @s run function guncraft:core/sounds/normal_shot

# 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/fire_gun/projectile_set
    scoreboard players set @s GunCraft.recoil 6
    execute if predicate guncraft:flag/sneaking run scoreboard players set @s GunCraft.recoil 5

# 微調整
    scoreboard players set @s GunCraft.cool_time 2
    execute if score @s GunCraft.sneak matches 1.. run scoreboard players add @s GunCraft.cool_time 2
    tp @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] ^ ^ ^0.5 ~ ~
    execute unless score @s GunCraft.sneak matches 1.. as @e[tag=GunCraft.preparation,limit=1] at @s run function guncraft:core/fire_gun/spread
    tag @e[type=marker,tag=GunCraft.preparation,sort=nearest,limit=1] remove GunCraft.preparation