#> guncraft:core/projectile/in_water/bom
#
# 水中の爆弾
#
# @within function guncraft:core/projectile/in_water/

    particle explosion ~ ~ ~ 0 0 0 0 1 normal
    playsound minecraft:entity.firework_rocket.blast master @s ~ ~ ~ 1 0.5
    tag @s remove GunCraft.bom