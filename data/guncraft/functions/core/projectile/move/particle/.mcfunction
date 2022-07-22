#> guncraft:core/projectile/move/particle/
#
# 移動時のパーティクル表示
#
# @within function guncraft:core/projectile/move/particle/player_check

# パーティクル表示
    ## 爆弾
        execute if entity @s[tag=GunCraft.bom] run particle minecraft:flame ^ ^ ^ 0 0 0 0 1 force @a[tag=show_particle]
        execute if entity @s[tag=GunCraft.bom] run particle minecraft:smoke ^ ^ ^ 0 0 0 0.03 1 force @a[tag=show_particle]
    ## 光線
        execute if entity @s[tag=GunCraft.light] run particle minecraft:firework ^ ^ ^ 0 0 0 0 1 force @a[tag=show_particle]
    ## 火
        execute if entity @s[tag=GunCraft.fire] run particle flame ~ ~ ~ 0 0 0 0 1 force @a[tag=show_particle]
    ## 普通
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] unless block ~ ~ ~ #guncraft:in_water run particle minecraft:crit ^ ^ ^ 0 0 0 0 1 force @a[tag=show_particle]
    ## 水中
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] if block ~ ~ ~ #guncraft:in_water run particle minecraft:bubble ^ ^ ^ 0 0 0 0 1 force @a[tag=show_particle]