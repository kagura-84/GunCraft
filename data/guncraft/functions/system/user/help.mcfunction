#> guncraft:system/user/help
#
# Help
#
# @within function guncraft:system/user/main

tellraw @s {"text": "-- help --","color": "blue"}
tellraw @s [{"color":"green","text":"    [ /trigger Help ]","clickEvent": {"action": "run_command","value": "/trigger Help"}},{"color": "white","text": "  ヘルプを表示します"}]
tellraw @s [{"color":"green","text":"    [ /trigger GunParticle ]","clickEvent": {"action": "run_command","value": "/trigger GunParticle"}},{"color": "white","text": "  銃のパーティクル表示を すべて/少なめ にする"}]

scoreboard players enable @s Help
scoreboard players set @s Help 0