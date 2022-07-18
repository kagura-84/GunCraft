#> guncraft:core/projectile/hit/explosion
#
# 地形破壊しない爆発
#
# @within function guncraft:core/projectile/**

    summon creeper ~ ~200 ~ {CustomName:'{"text":"Bazooka"}',Invulnerable:1b,ExplosionRadius:2b,Tags:[explosion],Fuse:0}
    execute at @s as @e[tag=explosion,sort=nearest] run tp @s ~ ~0.2 ~
    tag @e[tag=explosion] remove explosion