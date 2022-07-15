#> guncraft:core/recoil

    tp @s ~ ~ ~ ~ ~-1
    execute if score @s GunCraft.recoil matches 2.. run tp @s ~ ~ ~ ~ ~-1
    execute if score @s GunCraft.recoil matches 4.. run tp @s ~ ~ ~ ~ ~-1
    execute if score @s GunCraft.recoil matches 2.. run tp @s ~ ~ ~ ~ ~-1
    execute if score @s GunCraft.recoil matches 8.. run tp @s ~ ~ ~ ~ ~-1
    execute if score @s GunCraft.recoil matches 10.. run tp @s ~ ~ ~ ~ ~-1

    scoreboard players remove @s GunCraft.recoil 1
    execute if score @s GunCraft.recoil matches 6.. run scoreboard players remove @s GunCraft.recoil 1
    execute if score @s GunCraft.recoil matches 10.. run scoreboard players remove @s GunCraft.recoil 1