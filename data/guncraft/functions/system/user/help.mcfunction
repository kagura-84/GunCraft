#> guncraft:system/user/help
#
#

tellraw @s {"text": "-- help --","color": "blue"}
tellraw @s [{"color":"green","text":"    [ /trigger Help ]","clickEvent": {"action": "run_command","value": "/trigger Help"}},{"color": "white","text": "  ヘルプを表示します"}]
tellraw @s [{"color":"green","text":"    [ /trigger GunSound ]","clickEvent": {"action": "run_command","value": "/trigger GunSound"}},{"color": "white","text": "  銃のサウンドを 有効/無効 にする"}]

scoreboard players enable @s Help
scoreboard players set @s Help 0