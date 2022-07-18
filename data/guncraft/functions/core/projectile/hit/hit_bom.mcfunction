#> guncraft:core/projectile/hit/hit_bom
#
# 爆弾にあたったときの処理
#
# @within function guncraft:core/projectile/hit/

# tnt
    execute if entity @s[type=tnt] run data modify entity @s Fuse set value 1

# end_crystal
    execute if entity @s[type=end_crystal] run summon tnt