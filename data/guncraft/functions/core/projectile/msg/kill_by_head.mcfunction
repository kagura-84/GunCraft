#> guncraft:core/projectile/msg/kill_by_head

execute if entity @s[tag=GunCraft.hit_bom] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に盛大に爆破された"}]
execute if entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に超アツアツにされた"}]
execute if entity @s[tag=GunCraft.hit_light] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" にきれいに撃ち抜かれた"}]
execute unless entity @s[tag=GunCraft.hit_bom] unless entity @s[tag=GunCraft.hit_light] unless entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に正確に撃たれた"}]