#> guncraft:core/projectile/move/
#
# 弾丸が動くぜ
#
# @public

# 識別用tag付与
    tag @s add projectile_this

# 再帰カウントリセット
    execute if score @s GunCraft.recursion matches 0 run scoreboard players operation @s GunCraft.recursion = @s GunCraft.speed

# 動くよ
    ## 空中
        tp @s ^ ^ ^0.25 ~ ~

    ## 水中
        execute at @s if block ~ ~ ~ #guncraft:in_water run function guncraft:core/projectile/in_water/

# パーティクル表示
    function guncraft:core/projectile/move/particle

# 衝突判定
    execute at @s positioned ~-0.125 ~-0.125 ~-0.125 if entity @e[dx=0,limit=1,type=!#guncraft:no_health] positioned ~-0.75 ~-0.75 ~-0.75 if entity @e[nbt={Invulnerable: 0b},dx=0,limit=1,type=!#guncraft:no_health] run function guncraft:core/projectile/hit/

# スコア減算
    scoreboard players remove @s GunCraft.reach 1
    scoreboard players remove @s GunCraft.recursion 1

# ブロックの衝突
    ## bomだったら爆発
        execute unless block ~ ~ ~ #guncraft:no_collision if entity @s[tag=GunCraft.bom] run function guncraft:core/projectile/hit/explosion

        ### 水中
            execute if entity @s[tag=GunCraft.bom] if block ~ ~ ~ #guncraft:in_water run kill @s

    ## light以外ならキル
        execute unless entity @s[tag=GunCraft.light] unless block ~ ~ ~ #guncraft:no_collision run kill @s

    ## 透過しなさそうなのにあたったらキル
        execute if entity @s[tag=GunCraft.light] unless block ~ ~ ~ #guncraft:transparent run kill @s

# 識別用tag削除
    tag @s remove projectile_this

# 再帰
    execute if entity @s[scores={GunCraft.reach=1..,GunCraft.recursion=1..}] at @s anchored eyes positioned ^ ^ ^ run function guncraft:core/projectile/move/

# 弾丸破壊
    ## bomだったら爆発
        execute if score @s GunCraft.reach matches 0 if entity @s[tag=GunCraft.bom] run function guncraft:core/projectile/hit/explosion

    execute if score @s GunCraft.reach matches 0 run kill @s