#> guncraft:core/cool_set
#
# playerがスロットを移動させたときのcool_time
#
# @within function guncraft:core/score_get

# hand_gun
    execute if predicate guncraft:have/main/hand_gun run scoreboard players set @s GunCraft.cool_time 5

# fire_gun
    execute if predicate guncraft:have/main/fire_gun run scoreboard players set @s GunCraft.cool_time 5

# lazer_hand_gun
    execute if predicate guncraft:have/main/lazer_hand_gun run scoreboard players set @s GunCraft.cool_time 5

# 3burst
    execute if predicate guncraft:have/3burst run scoreboard players set @s GunCraft.cool_time 6

# rifle
    execute if predicate guncraft:have/rifle run scoreboard players set @s GunCraft.cool_time 20

# lazer_rifle
    execute if predicate guncraft:have/lazer_rifle run scoreboard players set @s GunCraft.cool_time 20

# bazooka
    execute if predicate guncraft:have/bazooka run scoreboard players set @s GunCraft.cool_time 20

# scope_rifle
    execute if predicate guncraft:have/scope_rifle run scoreboard players set @s GunCraft.cool_time 40