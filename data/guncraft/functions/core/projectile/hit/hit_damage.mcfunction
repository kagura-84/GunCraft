#> guncraft:core/projectile/hit/hit_damage
#
# damage
#
# @within function guncraft:core/hit

# 攻撃したプレイヤーにtag付与
#    execute as @a if score @s GunCraft.PlayerID = @e[type=marker,sort=nearest,limit=1] GunCraft.PlayerID run tag @s add attack_player

# 攻撃音
    execute at @a[tag=attack_player] run playsound block.note_block.bell player @a ~ ~ ~ 1 1.5

# ダメージ設定
    data merge storage senba.damage {damage: 100, armor_rate: 0, effect_rate: 100, motion: 0b, player_motion: 1b, owner: []}
    execute store result storage senba.damage damage int 1.0 run scoreboard players get @s GunCraft.damage
    execute store result storage senba.damage armor_rate int 1.0 run scoreboard players get @s Guncraft.penetration
    data modify storage senba.damage owner set from entity @a[tag=attack_player,limit=1] UUID
    execute if entity @s[tag=GunCraft.fire] as @e[tag=damage] unless predicate guncraft:effect/fire_resistance run function guncraft:core/projectile/hit/fire_hit

# ヘッドショット判定
    execute as @e[tag=damage] at @s anchored eyes positioned ^ ^ ^ positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[dx=0,tag=projectile_this] run function guncraft:core/projectile/hit/head_shot

# ダメージ
    execute as @e[tag=damage] run function senba.damage:main

# tag解除
    tag @a[tag=attack_player] remove attack_player
    tag @e[tag=damage] remove damage

# 弾丸破壊
    execute if entity @s[tag=GunCraft.bom] at @s run summon tnt
    kill @s