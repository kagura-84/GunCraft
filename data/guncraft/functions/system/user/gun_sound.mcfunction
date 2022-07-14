#> guncraft:system/user/gun_sound
#
#

scoreboard players add @s Setting.GunSound 1
scoreboard players operation @s Setting.GunSound %= $2 GunCraft.Number
execute if score @s Setting.GunSound matches 0 run tellraw @s {"text": "銃のサウンドを無効にしました","color": "red"}
execute if score @s Setting.GunSound matches 1 run tellraw @s {"text": "銃のサウンドを有効にしました","color": "green"}

scoreboard players enable @s GunSound
scoreboard players set @s GunSound 0