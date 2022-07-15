#> guncraft:core/projectile/hit/hit_damage
#
# damage
#
# @within function guncraft:core/projectile/hit/

# 攻撃音
    execute at @a[tag=attack_player] run playsound block.note_block.bell player @a ~ ~ ~ 1 1.5

# ダメージ設定
    data modify storage score_damage: Argument set value {Damage:1,DamageType:"Projectile"}
    execute store result storage score_damage: Argument.Damage int 1 run scoreboard players get @s GunCraft.damage
    execute if entity @s[tag=GunCraft.fire] run data modify storage score_damage: Argument.DamageType set value "Fire"
    execute if entity @s[tag=GunCraft.bom] run data modify storage score_damage: Argument.DamageType set value "Blast"
    execute if entity @s[tag=GunCraft.light] run data modify storage score_damage: Argument.DamageType set value "None"
    execute if entity @s[tag=GunCraft.fire] as @e[tag=damage] unless predicate guncraft:effect/fire_resistance run function guncraft:core/projectile/hit/fire_hit

# ヘッドショット判定
    execute as @e[tag=damage] at @s anchored eyes positioned ^ ^ ^ positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[dx=0,tag=projectile_this] run function guncraft:core/projectile/hit/head_shot

# ダメージ
    execute as @e[tag=damage] at @s run function guncraft:core/projectile/hit/uuid_hit
    execute as @e[tag=damage] run function score_damage:api/attack
    data remove storage score_damage: Damage

# tag解除
    tag @a[tag=attack_player] remove attack_player
    tag @e[tag=damage] remove damage

# 弾丸破壊
    execute if entity @s[tag=GunCraft.bom] at @s run function guncraft:core/projectile/explosion
    kill @s