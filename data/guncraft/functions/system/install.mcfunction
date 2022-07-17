#> guncraft:system/install
#
# Playerのinstall
#
# @private

    scoreboard players set @s Setting.GunSound 1
    scoreboard players set @s Help 0
    scoreboard players set @s GunSound 0
    scoreboard players set @s GunCraft.cool_time 0
    scoreboard players set @s GunCraft.trigger 0
    scoreboard players enable @s Help
    scoreboard players enable @s GunSound
    scoreboard players enable @s GunCraft.trigger

tellraw @s [{ "text": "-----------------------------","color": "yellow"},{ "text": "\n\nデータパック [ ","color": "white"},{"text": "GunCraft","color": "blue"},{"text": " ] の導入が完了しました\n\n v0.1.0\n","color": "white"},{"text": "-----------------------------","color": "yellow"}]