#> guncraft:system/load
#
# load
#
# @private

# 威力
    scoreboard objectives add GunCraft.damage dummy
# ヘッドショットのダメージ
    scoreboard objectives add GunCraft.head_damage dummy
# 弾速
    scoreboard objectives add GunCraft.speed dummy
# 弾速の減衰
    scoreboard objectives add GunCraft.fall dummy
# 銃の射程
    scoreboard objectives add GunCraft.reach dummy
# 再帰カウント
    scoreboard objectives add GunCraft.recursion dummy
# 防御貫通
    scoreboard objectives add Guncraft.penetration dummy
# PlayerID
    scoreboard objectives add GunCraft.PlayerID dummy
# hit処理実行
    scoreboard objectives add GunCraft.hit dummy
# 計算用の数字
    scoreboard objectives add GunCraft.Number dummy
# 銃のトリガー
    scoreboard objectives add GunCraft.trigger trigger
# クールタイム
    scoreboard objectives add GunCraft.cool_time dummy
# click
    scoreboard objectives add GunCraft.Rclick minecraft.used:minecraft.carrot_on_a_stick
# sneak
    scoreboard objectives add GunCraft.sneak custom:sneak_time

# Help
    scoreboard objectives add Help trigger
# GunSound
    scoreboard objectives add GunSound trigger

# Setting.GunSound
    scoreboard objectives add Setting.GunSound dummy

# スコア設定
    execute unless score $Global GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players set $Global GunCraft.PlayerID 0
    execute unless score $2 GunCraft.Number matches -2147483648..2147483647 run scoreboard players set $2 GunCraft.Number 2