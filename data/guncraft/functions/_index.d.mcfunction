#> guncraft:_index.d
# @private
 #declare score_holder $Global グローバルなスコアホルダー(Playerは設定できないよ)
 #declare storage senba.damage ダメージ設定用ストレージ
 #declare tag attack_player 誰が撃った弾丸か判別するために一時的に付与するよ
 #declare score_holder $2 設定用の数字保存するやつ
 #declare tag damage HitしたEntity
 #declare tag GunCraft.bom 爆発しそうな弾丸についてる
 #declare tag GunCraft.light 光線っぽい弾丸についてる
 #declare tag GunCraft.fire
 #declare tag/block guncraft:no_collision
 #declare tag/block guncraft:in_water
 #declare tag in_water 水にぶち込まれた弾丸につく
 #declare tag projectile_this
