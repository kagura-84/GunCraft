#> guncraft:core/projectile/hit/
#
# hit処理
#
# @within function guncraft:core/move

# ダメージ処理をon
    scoreboard players set $Global GunCraft.hit 1

# HitしたEntityにTagを付与
    execute at @s positioned ~-0.125 ~-0.125 ~-0.125 as @e[dx=0,type=!#guncraft:no_health] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[dx=0,sort=nearest,limit=1] run tag @s add damage

# もしHitしたEntityが発射したPlayerならダメージ処理をoff
    execute as @a if score @s GunCraft.PlayerID = @e[tag=projectile_this,limit=1] GunCraft.PlayerID run tag @s add attack_player
    execute if entity @a[tag=attack_player,tag=damage] run scoreboard players set $Global GunCraft.hit 0

# 爆発しそうなEntityにHitしたら即爆発☆
    execute if score $Global GunCraft.hit matches 1 as @e[tag=damage] if entity @s[type=#guncraft:bom] at @s run function guncraft:core/projectile/hit/hit_bom
    execute if score $Global GunCraft.hit matches 1 if entity @e[tag=damage,type=#guncraft:bom] run kill @s

# ダメージ与える
    execute if score $Global GunCraft.hit matches 1 run function guncraft:core/projectile/hit/hit_damage

    tag @e[tag=damage] remove damage