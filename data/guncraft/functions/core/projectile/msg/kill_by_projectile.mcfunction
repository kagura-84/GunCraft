#> guncraft:core/projectile/msg/kill_by_projectile

gamerule showDeathMessages false

execute if entity @s[tag=head_shot] run function guncraft:core/projectile/msg/kill_by_head
execute unless entity @s[tag=head_shot] run function guncraft:core/projectile/msg/kill_by_bady

kill @s

gamerule showDeathMessages true