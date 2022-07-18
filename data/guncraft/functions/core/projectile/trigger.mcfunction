#> guncraft:core/projectile/trigger
#
# 発射処理
#
# @within function guncraft:core/main

# 発射位置のオフセット設定
    function guncraft:core/projectile/shift/

# 発射
    ## hand_gun
        execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_hand matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/hand_gun/shot
        execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_hand matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/hand_gun/shot
        execute if predicate guncraft:have/hand_gun if score @s GunCraft.use_hand matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/hand_gun/shot

    ## rifle
        execute if predicate guncraft:have/rifle run function guncraft:core/rifle/shot

    ## bazooka
        execute if predicate guncraft:have/bazooka if score @s GunCraft.sneak matches 20.. run function guncraft:core/bazooka/shot

    ## 3burst
        execute if predicate guncraft:have/3burst run scoreboard players set @s GunCraft.recursion 3
        execute if predicate guncraft:have/3burst run function guncraft:core/3burst/shot

    ## lazer_rifle
        execute if predicate guncraft:have/lazer_rifle run function guncraft:core/lazer_rifle/shot

    ## lazer_hand_gun
        execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_hand matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/lazer_hand_gun/shot
        execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_hand matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/lazer_hand_gun/shot
        execute if predicate guncraft:have/lazer_hand_gun if score @s GunCraft.use_hand matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/lazer_hand_gun/shot

    ## fire_gun
        execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_hand matches 0 at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/fire_gun/shot
        execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_hand matches 1 at @s anchored eyes positioned ^0.2 ^ ^ run function guncraft:core/fire_gun/shot
        execute if predicate guncraft:have/fire_gun if score @s GunCraft.use_hand matches -1 at @s anchored eyes positioned ^-0.2 ^ ^ run function guncraft:core/fire_gun/shot

    ## scope_rifle
        execute if predicate guncraft:have/scope_rifle run function guncraft:core/scope_rifle/shot

# スコアリセット
    scoreboard players set @s GunCraft.trigger 0