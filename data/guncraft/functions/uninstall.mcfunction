#> guncraft:uninstall

# msg
    tellraw @a {"color": "yellow","text": "データパック [ GunCraft ] をアンインストールします"}
    tellraw @a {"color": "yellow","text": "[ 0 / 2 ]"}

# GunCraft
    scoreboard objectives remove GunCraft.cool_time
    scoreboard objectives remove GunCraft.damage
    scoreboard objectives remove GunCraft.head_damage
    scoreboard objectives remove GunCraft.hit
    scoreboard objectives remove GunCraft.PlayerID
    scoreboard objectives remove GunCraft.Rclick
    scoreboard objectives remove GunCraft.reach
    scoreboard objectives remove GunCraft.recursion
    scoreboard objectives remove GunCraft.sneak
    scoreboard objectives remove GunCraft.speed
    scoreboard objectives remove GunCraft.trigger
    scoreboard objectives remove GunCraft.recoil
    scoreboard objectives remove GunSound
    scoreboard objectives remove Help
    scoreboard objectives remove Setting.GunSound

    tellraw @a {"color": "yellow","text": "[ 1 / 2 ]"}

# ScoreToHealth
    scoreboard objectives remove ScoreToHealth

    tellraw @a {"color": "yellow","text": "[ 2 / 2 ]"}

# msg
    tellraw @a {"color": "yellow","text": "データパック [ GunCraft ] のスコアが削除されました"}

# アンインストールｯ
    execute store success score $uninstall GunCraft.Number run datapack disable "file/GunCraft.zip"
    execute if score $uninstall GunCraft.Number matches 1 run scoreboard objectives remove GunCraft.Number
    execute unless score $uninstall GunCraft.Number matches 1 run tellraw @a {"color": "red","text": "データパック [ GunCraft ] のアンインストールが失敗しました"}