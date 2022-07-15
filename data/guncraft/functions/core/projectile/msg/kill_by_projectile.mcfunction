#> guncraft:core/projectile/msg/kill_by_projectile

gamerule showDeathMessages false

execute if entity @s run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に撃たれた"}]

gamerule showDeathMessages true