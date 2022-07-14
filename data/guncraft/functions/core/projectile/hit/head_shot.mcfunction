#> guncraft:core/projectile/hit/head_shot
#
# HeadShot
#
# @within function guncraft:core/damage

execute store result storage senba.damage damage int 1.0 run scoreboard players get @e[tag=projectile_this,limit=1] GunCraft.head_damage
execute if entity @e[tag=projectile_this,tag=GunCraft.bom] run summon tnt
execute at @a[tag=attack_player,limit=1] run playsound minecraft:block.note_block.bell player @a ~ ~ ~ 1 1.5
execute at @a[tag=attack_player,limit=1] run playsound minecraft:block.anvil.place player @a ~ ~ ~ 1 2
execute at @s anchored eyes positioned ^ ^ ^ run particle flash ~ ~ ~ 0 0 0 0 1 force
execute at @s anchored eyes positioned ^ ^ ^ run particle end_rod ~ ~ ~ 0 0 0 0.1 5 force
execute at @s anchored eyes positioned ^ ^ ^ as @e[tag=projectile_this] run particle flame ~ ~ ~ 0 0 0 0.1 5 force