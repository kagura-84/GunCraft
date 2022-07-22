#> guncraft:core/projectile/hit/head_shot
#
# HeadShot
#
# @within function guncraft:core/projectile/hit/hit_damage

# ヘッドショット用スコア代入
    execute store result storage score_damage: damage float 1.0 run scoreboard players get @e[tag=projectile_this,limit=1] GunCraft.head_damage

# bomだったら爆発
    execute if entity @e[tag=projectile_this,tag=GunCraft.bom] run function guncraft:core/projectile/hit/explosion

# ダメージ判別用tag付与
    tag @s add head_shot

# 攻撃音
    execute as @a[tag=attack_player] at @s run playsound minecraft:block.note_block.bell player @s ~ ~ ~ 1 1.5 1
    execute as @a[tag=attack_player] at @s run playsound minecraft:block.anvil.place player @s ~ ~ ~ 1 2 1
    execute at @s run playsound minecraft:block.note_block.bell player @a[tag=!attack_player] ~ ~ ~ 1 1.5 1
    execute at @s run playsound minecraft:block.anvil.place player @a[tag=!attack_player] ~ ~ ~ 1 2 1

# パーティクル表示
    execute at @s anchored eyes positioned ^ ^ ^ run particle flash ~ ~ ~ 0 0 0 0 1 force @a[tag=!damage]
    execute at @s anchored eyes positioned ^ ^ ^ run particle end_rod ~ ~ ~ 0 0 0 0.1 5 force
    execute at @s if entity @s[tag=GunCraft.hit_fire] anchored eyes positioned ^ ^ ^ as @e[tag=projectile_this] run particle flame ~ ~ ~ 0 0 0 0.1 5 force