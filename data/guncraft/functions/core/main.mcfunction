#> guncraft:core/main
#
# playerごとのtick処理
#
# @within function guncraft:system/tick

### スコアとnbt取得
    function guncraft:core/score_get

### リコイル
    execute if score @s GunCraft.recoil matches 1.. at @s run function guncraft:core/recoil

execute if score @s GunCraft.cool_time matches 0 if predicate guncraft:have/gun run scoreboard players enable @s GunCraft.trigger
execute at @s if score @s GunCraft.cool_time matches 1 if predicate guncraft:have/gun run function guncraft:core/sounds/reload
execute if score @s GunCraft.cool_time matches 1.. if predicate guncraft:have/gun unless predicate guncraft:have/scope_rifle run scoreboard players remove @s GunCraft.cool_time 1
execute if score @s GunCraft.cool_time matches 1.. if predicate guncraft:have/gun_double run scoreboard players remove @s GunCraft.cool_time 1
execute if predicate guncraft:have/gun unless predicate guncraft:have/bazooka unless predicate guncraft:have/scope_rifle if score @s GunCraft.Rclick matches 1.. run trigger GunCraft.trigger add 1
execute if predicate guncraft:have/bazooka if score @s GunCraft.sneak matches 20.. if score @s GunCraft.Rclick matches 1.. run trigger GunCraft.trigger add 1

execute if score @s GunCraft.trigger matches 1.. run function guncraft:core/projectile/trigger

execute if predicate guncraft:flag/sneaking if predicate guncraft:have/hand_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:flag/sneaking if predicate guncraft:have/rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:4b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/bazooka at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:2b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:flag/sneaking if predicate guncraft:have/bazooka at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:5b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/3burst at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/lazer_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:flag/sneaking if predicate guncraft:have/lazer_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:4b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/lazer_hand_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:flag/sneaking if predicate guncraft:have/fire_gun at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:1b,Duration:2,ShowParticles:0b}]}
execute if predicate guncraft:have/scope_rifle at @s run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:0b,Duration:2,ShowParticles:0b}]}

execute if score @s GunCraft.Rclick matches 1.. run scoreboard players reset @s GunCraft.Rclick
execute unless predicate guncraft:flag/sneaking if score @s GunCraft.sneak matches 1.. run scoreboard players reset @s GunCraft.sneak
execute unless entity @s[advancements={guncraft:using_scope=true}] if score @s GunCraft.using_scope matches 1.. unless score @s GunCraft.cool_time matches 0 run scoreboard players set @s GunCraft.cool_time 40
execute unless entity @s[advancements={guncraft:using_scope=true}] if score @s GunCraft.using_scope matches 1.. unless score @s GunCraft.cool_time matches 0 run scoreboard players set @s GunCraft.using_scope 0
execute unless entity @s[advancements={guncraft:using_scope=true}] if score @s GunCraft.using_scope matches 1.. if score @s GunCraft.cool_time matches 0 run trigger GunCraft.trigger add 1
execute if entity @s[advancements={guncraft:using_scope=true}] run advancement revoke @s only guncraft:using_scope