# >damage/player

#一瞬耐性5を与え､バグを対策する
execute as @s[nbt={HurtTime:0s}] run summon area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:11,Amplifier:5,Duration:2,ShowParticles:0b}]}
#いい感じにダメージモーションを取らせる

effect give @s[nbt={HurtTime:0s}] instant_damage 1 0 true
#無敵時間内ならサウンドで代用する
execute as @s[nbt=!{HurtTime:0s}] run playsound entity.player.hurt player @a ~ ~ ~ 1 1

