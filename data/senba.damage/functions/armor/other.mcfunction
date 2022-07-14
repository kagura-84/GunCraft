# >armor/main


# ダメージ軽減検知
  execute store result score #senba.damage-armorH senbaD.score run data get entity @s ArmorItems[3].tag.Enchantments[{id:"minecraft:protection"}].lvl 4
  execute store result score #senba.damage-armorC senbaD.score run data get entity @s ArmorItems[2].tag.Enchantments[{id:"minecraft:protection"}].lvl 4
  execute store result score #senba.damage-armorL senbaD.score run data get entity @s ArmorItems[1].tag.Enchantments[{id:"minecraft:protection"}].lvl 4
  execute store result score #senba.damage-armorB senbaD.score run data get entity @s ArmorItems[0].tag.Enchantments[{id:"minecraft:protection"}].lvl 4
  #エンチャント
  scoreboard players operation #senba.damage-armorH senbaD.score += #senba.damage-armorC senbaD.score
  scoreboard players operation #senba.damage-armorL senbaD.score += #senba.damage-armorB senbaD.score
  scoreboard players operation #senba.damage-armorH senbaD.score += #senba.damage-armorL senbaD.score
  execute if score #senba.damage-armorH senbaD.score matches 40.. run scoreboard players set #senba.damage-armorH senbaD.score 40
  scoreboard players operation #senba.damage-armorH senbaD.score *= #senba.damage-armor senbaD.score
  scoreboard players operation #senba.damage-armorH senbaD.score /= $100 senbaD.score
