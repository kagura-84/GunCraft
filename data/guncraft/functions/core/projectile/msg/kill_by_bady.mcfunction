#> guncraft:core/projectile/msg/kill_by_bady

execute if entity @s[tag=GunCraft.hit_bom] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に爆破された"}]
execute if entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に熱々にされた"}]
execute if entity @s[tag=GunCraft.hit_light] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に撃ち抜かれた"}]
execute unless entity @s[tag=GunCraft.hit_bom] unless entity @s[tag=GunCraft.hit_fire] unless entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に撃たれた"}]