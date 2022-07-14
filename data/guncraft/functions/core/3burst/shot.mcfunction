#> guncraft:core/3burst/shot

# 弾丸召喚
    summon marker ^ ^ ^ {Tags: ["GunCraft.projectile", "GunCraft.preparation"]}
    scoreboard players operation @e[tag=GunCraft.preparation] GunCraft.PlayerID = @s GunCraft.PlayerID
    execute at @s run function guncraft:core/sounds/light_shot

# 弾丸の性能設定
    execute as @e[tag=GunCraft.preparation] run function guncraft:core/3burst/projectile_set
    scoreboard players set @s GunCraft.recoil 6
    execute if predicate guncraft:flag/sneaking run scoreboard players set @s GunCraft.recoil 4

# 微調整
    scoreboard players set @s GunCraft.cool_time 6
    execute at @s anchored eyes positioned ^ ^ ^ run tp @e[tag=GunCraft.preparation] ^ ^ ^0.5 ~ ~
    execute as @e[tag=GunCraft.preparation] at @s run function guncraft:core/3burst/spread
    tag @e[tag=GunCraft.preparation] remove GunCraft.preparation
    
# 再帰
    scoreboard players remove @s GunCraft.recursion 1
    execute if score @s GunCraft.recursion matches 1.. run function guncraft:core/3burst/shot