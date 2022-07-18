#> guncraft:core/projectile/trigger

execute if predicate guncraft:have/gun_double if score @s GunCraft.use_gun matches 1 run scoreboard players set @s GunCraft.use_gun -1
execute if predicate guncraft:have/gun_double unless score @s GunCraft.use_gun matches 1 run scoreboard players set @s GunCraft.use_gun 1
execute unless predicate guncraft:have/gun_double unless score @s GunCraft.use_gun matches 0 run scoreboard players set @s GunCraft.use_gun 0

execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_gun matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/hand_gun/shot
execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_gun matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/hand_gun/shot
execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_gun matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/hand_gun/shot
execute if predicate guncraft:have/rifle run function guncraft:core/rifle/shot
execute if predicate guncraft:have/bazooka if score @s GunCraft.sneak matches 20.. run function guncraft:core/bazooka/shot
execute if predicate guncraft:have/3burst run scoreboard players set @s GunCraft.recursion 3
execute if predicate guncraft:have/3burst run function guncraft:core/3burst/shot
execute if predicate guncraft:have/lazer_rifle run function guncraft:core/lazer_rifle/shot
execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_gun matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/lazer_hand_gun/shot
execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_gun matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/lazer_hand_gun/shot
execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_gun matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/lazer_hand_gun/shot
execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_gun matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/fire_gun/shot
execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_gun matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/fire_gun/shot
execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_gun matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/fire_gun/shot
execute if predicate guncraft:have/scope_rifle run function guncraft:core/scope_rifle/shot

scoreboard players set @s GunCraft.trigger 0