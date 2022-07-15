#> guncraft:core/projectile/hit/uuid_hit

# AEC召喚
    execute if entity @s[type=#score_damage:undead] at @s anchored feet positioned ^ ^ ^ run summon area_effect_cloud ~ ~0.5 ~ {Particle:"block air",Tags:["uuid_hit"],Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:22b,Amplifier:1b,Duration:1,ShowParticles:0b},{Id:6b,Amplifier:0b,Duration:1,ShowParticles:0b}]}
    execute if entity @s[type=!#score_damage:undead] at @s anchored feet positioned ^ ^ ^ run summon area_effect_cloud ~ ~0.5 ~ {Particle:"block air",Tags:["uuid_hit"],Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:22b,Amplifier:1b,Duration:1,ShowParticles:0b},{Id:7b,Amplifier:0b,Duration:1,ShowParticles:0b}]}

# オーナーのUUIDをコピー
    data modify entity @e[type=minecraft:area_effect_cloud,tag=uuid_hit,limit=1,sort=nearest] Owner set from entity @e[tag=attack_player,limit=1] UUID

# tag解除
    tag @e[tag=uuid_hit] remove uuid_hit