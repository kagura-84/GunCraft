#> guncraft:core/projectile/trigger

execute if predicate guncraft:have/hand_gun run function guncraft:core/hand_gun/shot
execute if predicate guncraft:have/rifle run function guncraft:core/rifle/shot
execute if predicate guncraft:have/bazooka if score @s GunCraft.sneak matches 20.. run function guncraft:core/bazooka/shot
execute if predicate guncraft:have/3burst run scoreboard players set @s GunCraft.recursion 3
execute if predicate guncraft:have/3burst run function guncraft:core/3burst/shot
execute if predicate guncraft:have/lazer_rifle run function guncraft:core/lazer_rifle/shot
execute if predicate guncraft:have/lazer_hand_gun run function guncraft:core/lazer_hand_gun/shot
execute if predicate guncraft:have/fire_gun run function guncraft:core/fire_gun/shot

scoreboard players set @s GunCraft.trigger 0