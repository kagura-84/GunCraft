#> guncraft:system/load
#
# load処理
#
# @private


#> performance
# ____
# 弾丸の通常ダメージ
# @internal
scoreboard objectives add GunCraft.damage dummy

#> performance
# ____
# ヘッドショットのダメージ
# - GunCraft.damage より高い数値を設定することを推奨します
# @internal
scoreboard objectives add GunCraft.head_damage dummy

#> performance
# ____
# 弾速
# - [m/s]の 1/5 に相当します
# @internal
scoreboard objectives add GunCraft.speed dummy

#> performance
# ____
# 銃の射程
# - [m] の 4倍に相当します
# @internal
scoreboard objectives add GunCraft.reach dummy

#> temp
# ____
# 再帰カウント
# - システム内の処理で使用されます
# @internal
scoreboard objectives add GunCraft.recursion dummy

#> UUID
# ____
# PlayerID
# - プレイヤーごとに割り振られる固有のスコアです
# @internal
scoreboard objectives add GunCraft.PlayerID dummy

#> temp
# ____
# - 1tickで終了する内部処理で使用します
# @internal
scoreboard objectives add GunCraft.Temp dummy

#> trigger
# ____
# 銃のトリガー
# - 銃が発射されるとき使用します
# @internal
scoreboard objectives add GunCraft.trigger trigger

#> count
# ____
# クールタイム
# - 銃のクールタイムです
# - この値が0になるまで銃は発射されません
# @internal
scoreboard objectives add GunCraft.cool_time dummy

#> click
# ____
# クリック
# - 人参棒のクリック判定用スコアです
# @internal
scoreboard objectives add GunCraft.Rclick minecraft.used:minecraft.carrot_on_a_stick

#> count
# ____
# スニーク時間
# - スニークの持続時間です
# @internal
scoreboard objectives add GunCraft.sneak custom:sneak_time

#> count
# ____
# リコイル
# - 銃のリコイルです
# - 値が大きいほど強くリコイルします
# @internal
scoreboard objectives add GunCraft.recoil dummy

#> count
# ____
# オフセット
# - 銃のオフセットです
# - 両手持ちの際に発射位置を設定します
# - Min: -1
# - Max: 1
# @internal
scoreboard objectives add GunCraft.use_hand dummy

#> click
# ____
# 望遠鏡の使用時間
# @internal
scoreboard objectives add GunCraft.using_scope dummy

#> count
# ____
# リロード
# - リロードの進行度です
# - 0になるとリロードされます
scoreboard objectives add GunCraft.reload dummy

#> setting
# ____
# Help
# - 設定の呼び出し用スコアです
# @internal
scoreboard objectives add Help trigger

#> setting
# ____
# GunParticle
# - 設定の呼び出し用スコアです
# @internal
scoreboard objectives add GunParticle trigger

#> setting
# ____
# - 銃のパーティクル表示設定です
# @internal
scoreboard objectives add Setting.GunParticle dummy

#> temp
# ____
# - 選択中のスロットです
# @internal
scoreboard objectives add GunCraft.slot dummy

# スコア設定
    execute unless score $Global GunCraft.PlayerID matches -2147483648..2147483647 run scoreboard players set $Global GunCraft.PlayerID 0
    execute unless score $2 GunCraft.Temp matches -2147483648..2147483647 run scoreboard players set $2 GunCraft.Temp 2