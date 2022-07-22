#> guncraft:system/user/gun_particle
#
# パーティクル表示設定
#
# @within function guncraft:system/user/main

#> temp
# @private
    #declare score_holder $3

    scoreboard players set $3 GunCraft.Temp 3

    scoreboard players add @s Setting.GunParticle 1
    scoreboard players operation @s Setting.GunParticle %= $3 GunCraft.Temp

    execute if score @s Setting.GunParticle matches 0 run tellraw @s {"text": "銃のパーティクル表示を\"最小\"にしました","color": "green"}
    execute if score @s Setting.GunParticle matches 1 run tellraw @s {"text": "銃のパーティクル表示を\"少なめ\"にしました","color": "green"}
    execute if score @s Setting.GunParticle matches 2 run tellraw @s {"text": "銃のパーティクル表示を\"すべて\"にしました","color": "green"}

    scoreboard players enable @s GunParticle
    scoreboard players set @s GunParticle 0