#> guncraft:core/projectile/hit/tag

execute if entity @s[tag=GunCraft.bom] as @e[tag=damage] run tag @s add GunCraft.hit_bom
execute if entity @s[tag=GunCraft.fire] as @e[tag=damage] run tag @s add GunCraft.hit_fire
execute if entity @s[tag=GunCraft.light] as @e[tag=damage] run tag @s add GunCraft.hit_light