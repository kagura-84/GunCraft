#> guncraft:core/projectile/shift/

execute if predicate guncraft:have/gun_and unless entity @s[tag=shift] if score @s GunCraft.use_gun matches 1 run function guncraft:core/projectile/shift/minus_shift
execute if predicate guncraft:have/gun_and unless entity @s[tag=shift] unless score @s GunCraft.use_gun matches 1 run function guncraft:core/projectile/shift/plus_shift
execute unless predicate guncraft:have/gun_and unless entity @s[tag=shift] unless score @s GunCraft.use_gun matches 0 run scoreboard players set @s GunCraft.use_gun 0
tag @s remove shift