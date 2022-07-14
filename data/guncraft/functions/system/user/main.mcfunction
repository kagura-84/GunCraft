#> guncraft:system/user/main
#
# @private

execute as @a unless score @s Help matches 0 run function guncraft:system/user/help
execute as @a unless score @s GunSound matches 0 run function guncraft:system/user/gun_sound
