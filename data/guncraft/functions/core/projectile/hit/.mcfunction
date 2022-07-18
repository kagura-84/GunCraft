#> guncraft:core/projectile/hit/
#
# hit処理
#
# @within function guncraft:core/projectile/move/

#> temp
# @private
    #declare score_holder $hit Hit処理の実行

# ダメージ処理をon
    scoreboard players set $hit GunCraft.Temp 1

# HitしたEntityにTagを付与
    execute at @s positioned ~-0.125 ~-0.125 ~-0.125 as @e[dx=0,type=!#guncraft:no_health] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[dx=0,sort=nearest,limit=1] run tag @s add damage

    ## ダメージの種類に応じてtagを付与
        function guncraft:core/projectile/hit/tag

# もしHitしたEntityが発射したPlayerならダメージ処理をoff
    execute as @a if score @s GunCraft.PlayerID = @e[tag=projectile_this,limit=1] GunCraft.PlayerID run tag @s add attack_player
    execute if entity @a[tag=attack_player,tag=damage] run scoreboard players set $hit GunCraft.Temp 0

# 爆発しそうなEntityにHitしたら即爆発☆
    execute if score $hit GunCraft.Temp matches 1 as @e[tag=damage] if entity @s[type=#guncraft:bom] at @s run function guncraft:core/projectile/hit/hit_bom
    execute if score $hit GunCraft.Temp matches 1 if entity @e[tag=damage,type=#guncraft:bom] run kill @s

# ダメージ与える
    execute if score $hit GunCraft.Temp matches 1 run function guncraft:core/projectile/hit/hit_damage

# tag削除
    execute if entity @e[tag=GunCraft.hit_bom] run tag @e[tag=GunCraft.hit_bom] remove GunCraft.hit_bom
    execute if entity @e[tag=GunCraft.hit_fire] run tag @e[tag=GunCraft.hit_fire] remove GunCraft.hit_fire
    execute if entity @e[tag=GunCraft.hit_light] run tag @e[tag=GunCraft.hit_light] remove GunCraft.hit_light
    tag @a[tag=attack_player] remove attack_player
    tag @e[tag=damage] remove damage

# score_holder削除
    scoreboard players reset $hit GunCraft.Temp