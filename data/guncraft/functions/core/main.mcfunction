#> guncraft:core/main
#
# playerごとのtick処理
#
# @within advancement guncraft:player_tick

# スコアとnbt取得
    function guncraft:core/score_get

# リコイル
    execute if score @s GunCraft.recoil matches 1.. at @s run function guncraft:core/recoil

# クールタイム処理
    ## トリガーが引けるように
        execute if score @s GunCraft.cool_time matches 0 if predicate guncraft:have/gun run scoreboard players enable @s GunCraft.trigger

    ## サウンド
        execute at @s if score @s GunCraft.cool_time matches 1 if predicate guncraft:have/gun run function guncraft:core/sounds/reload

    ## クールタイム進行
        ### 普通
            execute if score @s GunCraft.cool_time matches 1.. if predicate guncraft:have/gun unless predicate guncraft:have/scope_rifle run scoreboard players remove @s GunCraft.cool_time 1

        ### 両手持ち
            execute if score @s GunCraft.cool_time matches 1.. if predicate guncraft:have/gun_double run scoreboard players remove @s GunCraft.cool_time 1

# 発射
    ## 普通
        execute if predicate guncraft:have/gun unless predicate guncraft:have/bazooka unless predicate guncraft:have/scope_rifle if score @s GunCraft.Rclick matches 1.. run trigger GunCraft.trigger add 1
    
    ## bazooka
        execute if predicate guncraft:have/bazooka if score @s GunCraft.sneak matches 20.. if score @s GunCraft.Rclick matches 1.. run function guncraft:core/shot_trigger/bazooka

    ## 発射処理
        execute if score @s GunCraft.trigger matches 1.. at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/projectile/trigger

# 減速
    ## hand_gun
        execute if predicate guncraft:flag/sneaking if predicate guncraft:have/hand_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}

    ## rifle
        execute if predicate guncraft:have/rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
        execute if predicate guncraft:flag/sneaking if predicate guncraft:have/rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:4b,Duration:2,ShowParticles:0b}]}

    ## bazooka
        execute if predicate guncraft:have/bazooka at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:2b,Duration:2,ShowParticles:0b}]}
        execute if predicate guncraft:flag/sneaking if predicate guncraft:have/bazooka at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:4b,Duration:2,ShowParticles:0b}]}

    ## 3burst
        execute if predicate guncraft:have/3burst at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
    
    ## lazer_rifle
        execute if predicate guncraft:have/lazer_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
        execute if predicate guncraft:flag/sneaking if predicate guncraft:have/lazer_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:4b,Duration:2,ShowParticles:0b}]}

    ## lazer_hand_gun
        execute if predicate guncraft:have/lazer_hand_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}

    ## fire_gun
        execute if predicate guncraft:flag/sneaking if predicate guncraft:have/fire_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:1b,Duration:2,ShowParticles:0b}]}

    ## scope_rifle
        execute if predicate guncraft:have/scope_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}

# スコア設定
    ## GunCraft.Rclick をリセット
        execute if score @s GunCraft.Rclick matches 1.. run scoreboard players reset @s GunCraft.Rclick

    ## スニークしていないなら GunCraft.sneak をリセット
        execute unless predicate guncraft:flag/sneaking if score @s GunCraft.sneak matches 1.. run scoreboard players reset @s GunCraft.sneak

    ## 1tick前まで scope_rifle が使用されていた
        ### キャンセル
            execute if entity @s[advancements={guncraft:using/scope_rifle=false}] if score @s GunCraft.using_scope matches 1.. if score @s GunCraft.cool_time matches 1.. run scoreboard players set @s GunCraft.cool_time 40
            execute if entity @s[advancements={guncraft:using/scope_rifle=false}] if score @s GunCraft.using_scope matches 1.. if score @s GunCraft.cool_time matches 1.. run scoreboard players set @s GunCraft.using_scope 0

        ### 発射
            execute if entity @s[advancements={guncraft:using/scope_rifle=false}] if score @s GunCraft.using_scope matches 1.. if score @s GunCraft.cool_time matches 0 run trigger GunCraft.trigger add 1

# 進捗剥奪
    execute if entity @s[advancements={guncraft:using/scope_rifle=true}] run advancement revoke @s only guncraft:using/scope_rifle
    advancement revoke @s only guncraft:player_tick