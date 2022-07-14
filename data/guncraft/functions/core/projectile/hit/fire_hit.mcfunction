#> guncraft:core/projectile/hit/fire_hit

execute if predicate guncraft:flag/on_fire store result storage senba.damage damage int 1.5 run data get storage senba.damage damage 1.0
execute if predicate guncraft:in/nether store result storage senba.damage damage int 1.5 run data get storage senba.damage damage 1.0
