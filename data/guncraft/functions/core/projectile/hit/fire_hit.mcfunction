#> guncraft:core/projectile/hit/fire_hit

execute if predicate guncraft:flag/on_fire store result storage score_damage: Damage int 2 run data get storage score_damage: Damage 1.0
execute if predicate guncraft:in/nether store result storage score_damage: Damage int 2 run data get storage score_damage: Damage 1.0
