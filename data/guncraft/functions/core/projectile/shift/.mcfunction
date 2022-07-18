#> guncraft:core/projectile/shift/
#
# オフセット変更
#
# @within function guncraft:core/projectile/trigger

# オフセット変更
    ## マイナス方向
        execute if predicate guncraft:have/gun_double unless entity @s[tag=shift] if score @s GunCraft.use_hand matches 1 run function guncraft:core/projectile/shift/minus_shift

    ## プラス方向
        execute if predicate guncraft:have/gun_double unless entity @s[tag=shift] unless score @s GunCraft.use_hand matches 1 run function guncraft:core/projectile/shift/plus_shift

    ## 真ん中
        execute unless predicate guncraft:have/gun_double unless entity @s[tag=shift] unless score @s GunCraft.use_hand matches 0 run scoreboard players set @s GunCraft.use_hand 0

# tag削除
    tag @s remove shift