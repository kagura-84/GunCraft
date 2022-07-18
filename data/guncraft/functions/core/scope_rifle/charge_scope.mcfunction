#> guncraft:core/scope_rifle/charge_scope
#
# scope_rifleのチャージ処理
#
# @within advancement guncraft:using/scope_rifle

# スコア
    ## 使用時間
        scoreboard players add @s GunCraft.using_scope 1

    ## クールタイム進行
        execute if score @s GunCraft.cool_time matches 1.. run scoreboard players remove @s GunCraft.cool_time 1

# チャージ完了!
    execute if score @s GunCraft.cool_time matches 1 run playsound block.note_block.bit player @s ~ ~ ~ 1 2
    execute if score @s GunCraft.cool_time matches 1 run playsound block.note_block.bell player @s ~ ~ ~ 1 0.5
    execute if score @s GunCraft.cool_time matches 1 anchored eyes positioned ^ ^ ^ run particle end_rod ~ ~ ~ 0.1 0.1 0.1 0.1 10 force @a[distance=1..]

# チャージ終わってたら減速
    execute if score @s GunCraft.cool_time matches 0 run summon area_effect_cloud ~ ~0.1 ~ {Particle:"minecraft:block air",Radius:0.4f,Duration:6,DurationOnUse:0,Age:4,WaitTime:0,Effects:[{Id:2b,Amplifier:5b,Duration:2,ShowParticles:0b}]}