#> guncraft:core/projectile/msg/kill_by_body
#
# 頭以外を打たれたときのデスメッセージ
#
# @within function guncraft:core/projectile/msg/kill_by_projectile

# bom
    execute if entity @s[tag=GunCraft.hit_bom] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に爆破された"}]

# fire
    execute if entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に熱々にされた"}]

# light
    execute if entity @s[tag=GunCraft.hit_light] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に撃ち抜かれた"}]

# normal
    execute unless entity @s[tag=GunCraft.hit_bom] unless entity @s[tag=GunCraft.hit_light] unless entity @s[tag=GunCraft.hit_fire] run tellraw @a [{"selector":"@s"},{"text":" は "},{"selector":"@a[tag=attack_player]"},{"text":" に撃たれた"}]