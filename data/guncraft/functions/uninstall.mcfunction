#> guncraft:uninstall

# msg
    tellraw @a {"color": "yellow","text": "データパック [ GunCraft ] をアンインストールします"}
    tellraw @a {"color": "yellow","text": "[ 0 / 3 ]"}

# GunCraft
    scoreboard objectives remove GunCraft.cool_time
    scoreboard objectives remove GunCraft.damage
    scoreboard objectives remove GunCraft.head_damage
    scoreboard objectives remove GunCraft.hit
    scoreboard objectives remove GunCraft.Number
    scoreboard objectives remove Guncraft.penetration
    scoreboard objectives remove GunCraft.PlayerID
    scoreboard objectives remove GunCraft.Rclick
    scoreboard objectives remove GunCraft.reach
    scoreboard objectives remove GunCraft.recursion
    scoreboard objectives remove GunCraft.sneak
    scoreboard objectives remove GunCraft.speed
    scoreboard objectives remove GunCraft.trigger
    scoreboard objectives remove GunSound
    scoreboard objectives remove Help
    scoreboard objectives remove Setting.GunSound
    scoreboard objectives remove GunCraft.fall

    tellraw @a {"color": "yellow","text": "[ 1 / 3 ]"}

# ScoreToHealth
    scoreboard objectives remove ScoreToHealth

    tellraw @a {"color": "yellow","text": "[ 2 / 3 ]"}

# senba
    scoreboard objectives remove senbaD.damage
    scoreboard objectives remove senbaD.health
    scoreboard objectives remove senbaD.score
    scoreboard objectives remove senbaD.totem

    tellraw @a {"color": "yellow","text": "[ 3 / 3 ]"}

# msg
    tellraw @a {"color": "yellow","text": "データパック [ GunCraft ] のスコアが削除されました"}

# アンインストールｯ
    datapack disable "file/GunCraft.zip"