#> guncraft:system/tick
#
# tick
#
# @private

execute as @a run function guncraft:core/main
execute if entity @e[type=marker,tag=GunCraft.projectile] as @e[type=marker,tag=GunCraft.projectile] at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/projectile/move