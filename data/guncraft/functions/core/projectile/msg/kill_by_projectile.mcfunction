#> guncraft:core/projectile/msg/kill_by_projectile
#
# デスメッセージ
#
# @public

#> temp
# @private
    #declare score_holder $gamerule ゲームルール保存用

# ゲームルール取得
    execute store result score $gamerule GunCraft.Temp run gamerule mobGriefing

# ゲームルール変更
    gamerule showDeathMessages false

# デスメッセージ
    ## ヘッドショット
        execute if entity @s[tag=head_shot] run function guncraft:core/projectile/msg/kill_by_head

    ## 普通
        execute unless entity @s[tag=head_shot] run function guncraft:core/projectile/msg/kill_by_body

# キル
    kill @s

# ゲームルール戻して
    execute if score $gamerule GunCraft.Temp matches 1 run gamerule showDeathMessages true
    execute if score $gamerule GunCraft.Temp matches 0 run gamerule showDeathMessages false