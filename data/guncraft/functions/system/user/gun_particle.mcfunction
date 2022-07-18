#> guncraft:system/user/gun_particle
#
# パーティクル表示設定
#
# @within function guncraft:system/user/main

    scoreboard players add @s Setting.GunParticle 1
    scoreboard players operation @s Setting.GunParticle %= $2 GunCraft.Temp

    execute if score @s Setting.GunParticle matches 0 run tellraw @s {"text": "銃のパーティクル表示を\"少なめ\"にしました","color": "red"}
    execute if score @s Setting.GunParticle matches 1 run tellraw @s {"text": "銃のパーティクル表示を\"すべて\"にしました","color": "green"}

    scoreboard players enable @s GunParticle
    scoreboard players set @s GunParticle 0