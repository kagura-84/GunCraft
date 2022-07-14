#> guncraft:core/projectile/in_water/

    execute if entity @s[tag=GunCraft.bom] run function guncraft:core/projectile/in_water/bom
    execute if entity @s[tag=GunCraft.fire] run function guncraft:core/projectile/in_water/fire
    execute unless entity @s[tag=GunCraft.light] if score @s GunCraft.reach matches 6.. run scoreboard players remove @s GunCraft.reach 5
    execute if score @s GunCraft.damage matches 100.. run scoreboard players remove @s GunCraft.damage 15
    execute if score @s Guncraft.penetration matches 3.. run scoreboard players remove @s Guncraft.penetration 2