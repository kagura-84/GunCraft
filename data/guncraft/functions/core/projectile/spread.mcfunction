#> guncraft:core/projectile/spread
#
# 拡散
#
# @within function guncraft:core/*/shot

# 返り値のEntity
    summon marker ~ ~ ~ {Tags:["SpreadMarker"]}

# 処理の実行
    execute at @p as @e[type=marker,tag=SpreadMarker,limit=1] run function forward_spreader:api/circle

# 実行者
    execute facing entity @e[type=marker,tag=SpreadMarker,limit=1] feet anchored eyes positioned ^ ^ ^10 run summon marker ~ ~ ~ {Tags:["point"]}
    execute anchored eyes positioned ^ ^ ^ run tp @s ^ ^ ^0.5 facing entity @e[tag=point,limit=1] eyes

# リセット
    kill @e[type=marker,tag=SpreadMarker,limit=1]
    kill @e[tag=point]