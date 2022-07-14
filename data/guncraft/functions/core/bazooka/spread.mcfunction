#> guncraft:core/bazooka/spread

# 返り値のEntity
    summon marker ~ ~ ~ {Tags:["SpreadMarker"]}
# 拡散の設定 
        data modify storage forward_spreader: Distance set value 10f
        data modify storage forward_spreader: Spread set value 0.1f
# 処理の実行
    execute at @s as @e[type=marker,tag=SpreadMarker,limit=1] run function forward_spreader:api/circle
# 実行者
    execute facing entity @e[type=marker,tag=SpreadMarker,limit=1] feet anchored eyes positioned ^ ^ ^ run tp @s ~ ~ ~ ~ ~
# リセット
    kill @e[type=marker,tag=SpreadMarker,limit=1]