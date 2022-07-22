#> guncraft:core/projectile/move/particle/player_check
#
# 移動時のパーティクル表示の判定
#
# @within function guncraft:core/projectile/move/

#> temp
# @private
    #declare score_holder $ShowParticle パーティクルをどのくらいのプレイヤーに表示するかの判定用
    #declare score_holder $3 計算用
    #declare tag show_particle パーティクル表示判定用

# スコア設定
    scoreboard players set $3 GunCraft.Temp 3
    scoreboard players operation $ShowParticle GunCraft.Temp = @s GunCraft.reach
    scoreboard players operation $ShowParticle GunCraft.Temp %= $3 GunCraft.Temp

# パーティクル表示(すべて)
    execute if score $ShowParticle GunCraft.Temp matches 0 run tag @a add show_particle

# パーティクル表示(少なめ)
    execute if score $ShowParticle GunCraft.Temp matches 1 as @a if score @s Setting.GunParticle matches 1.. run tag @s add show_particle

# パーティクル表示(最小)
    execute if score $ShowParticle GunCraft.Temp matches 2 as @a if score @s Setting.GunParticle matches 2.. run tag @s add show_particle

# パーティクル表示

    execute at @s run function guncraft:core/projectile/move/particle/

# tag削除
    tag @a[tag=show_particle] remove show_particle

# score_holder削除
    scoreboard players reset $ShowParticle GunCraft.Temp