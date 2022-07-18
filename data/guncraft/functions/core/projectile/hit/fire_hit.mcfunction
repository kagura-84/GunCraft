#> guncraft:core/projectile/hit/fire_hit
#
# fireの環境補正
#
# @within function guncraft:core/projectile/hit/hit_damage

    execute if predicate guncraft:flag/on_fire store result storage score_damage: Damage int 2 run data get storage score_damage: Damage 1.0
    execute if predicate guncraft:in/nether store result storage score_damage: Damage int 2 run data get storage score_damage: Damage 1.0
