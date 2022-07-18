#> guncraft:core/projectile/hit/tag
#
# ダメージの種類に応じてtagを付与
#
# @within function guncraft:core/projectile/hit/

# bom
    execute as @e[tag=damage] if entity @s[tag=GunCraft.bom] run tag @s add GunCraft.hit_bom

# fire
    execute as @e[tag=damage] if entity @s[tag=GunCraft.fire] run tag @s add GunCraft.hit_fire

# light
    execute as @e[tag=damage] if entity @s[tag=GunCraft.light] run tag @s add GunCraft.hit_light