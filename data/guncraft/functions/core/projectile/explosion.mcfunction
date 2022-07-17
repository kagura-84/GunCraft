#> guncraft:core/projectile/explosion

    summon creeper ~ ~200 ~ {CustomName:'{"text":"Bazooka"}',Invulnerable:1b,ExplosionRadius:2b,Tags:[explosion],Fuse:0}
    execute at @s as @e[tag=explosion,sort=nearest] run tp @s ~ ~ ~
    tag @e[tag=explosion] remove explosion