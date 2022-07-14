#> guncraft:core/projectile/hit/hit_bom
#
# 爆弾にあたったときの処理
#
# @within function guncraft:core/hit

execute if entity @s[type=tnt] run data modify entity @s Fuse set value 1
execute if entity @s[type=end_crystal] run summon tnt
