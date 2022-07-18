#> guncraft:core/projectile/move/particle
#
# 移動時のパーティクル表示
#
# @within function guncraft:core/projectile/move/

#> temp
# @private
    #declare score_holder $ShowParticle パーティクル表示が"少なめ"のプレイヤーに表示するかの判定用

# スコア設定
    scoreboard players operation $ShowParticle GunCraft.Temp = @s GunCraft.reach
    scoreboard players operation $ShowParticle GunCraft.Temp %= $2 GunCraft.Temp

# パーティクル表示
    ## 爆弾
        execute if entity @s[tag=GunCraft.bom] if score $ShowParticle GunCraft.Temp matches 1 run particle minecraft:flame ^ ^ ^ 0 0 0 0 1 force @a[distance=2..]
        execute if entity @s[tag=GunCraft.bom] if score $ShowParticle GunCraft.Temp matches 1 run particle minecraft:smoke ^ ^ ^ 0 0 0 0.03 1 force @a[distance=2..]
    ## 光線
        execute if entity @s[tag=GunCraft.light] if score $ShowParticle GunCraft.Temp matches 1 run particle minecraft:firework ^ ^ ^ 0 0 0 0 1 force @a[distance=2..]
    ## 火
        execute if entity @s[tag=GunCraft.fire] if score $ShowParticle GunCraft.Temp matches 1 run particle flame ~ ~ ~ 0 0 0 0 1 force @a[distance=2..]
    ## 普通
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] unless block ~ ~ ~ #guncraft:in_water if score $ShowParticle GunCraft.Temp matches 1 run particle minecraft:crit ^ ^ ^ 0 0 0 0 1 force @a[distance=2..]
    ## 水中
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] if block ~ ~ ~ #guncraft:in_water if score $ShowParticle GunCraft.Temp matches 1 run particle minecraft:bubble ^ ^ ^ 0 0 0 0 1 force @a[distance=2..]

# パーティクル表示(少なめ以外)
    ## 爆弾
        execute if entity @s[tag=GunCraft.bom] if score $ShowParticle GunCraft.Temp matches 0 run particle minecraft:flame ^ ^ ^ 0 0 0 0 1 force @a[distance=2..,scores={Setting.GunParticle=1}]
        execute if entity @s[tag=GunCraft.bom] if score $ShowParticle GunCraft.Temp matches 0 run particle minecraft:smoke ^ ^ ^ 0 0 0 0.03 1 force @a[distance=2..,scores={Setting.GunParticle=1}]
    ## 光線
        execute if entity @s[tag=GunCraft.light] if score $ShowParticle GunCraft.Temp matches 0 run particle minecraft:firework ^ ^ ^ 0 0 0 0 1 force @a[distance=2..,scores={Setting.GunParticle=1}]
    ## 火
        execute if entity @s[tag=GunCraft.fire] if score $ShowParticle GunCraft.Temp matches 0 run particle flame ~ ~ ~ 0 0 0 0 1 force @a[distance=2..,scores={Setting.GunParticle=1}]
    ## 普通
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] unless block ~ ~ ~ #guncraft:in_water if score $ShowParticle GunCraft.Temp matches 0 run particle minecraft:crit ^ ^ ^ 0 0 0 0 1 force @a[distance=2..,scores={Setting.GunParticle=1}]
    ## 水中
        execute at @s unless entity @s[tag=GunCraft.bom] unless entity @s[tag=GunCraft.light] unless entity @s[tag=GunCraft.fire] if block ~ ~ ~ #guncraft:in_water if score $ShowParticle GunCraft.Temp matches 0 run particle minecraft:bubble ^ ^ ^ 0 0 0 0 1 force @a[distance=2..,scores={Setting.GunParticle=1}]

# score_holder削除
    scoreboard players reset $ShowParticle GunCraft.Temp