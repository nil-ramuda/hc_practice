require './pokemon.rb'
require './pikachu.rb'

pikachu = Pikachu.new
pikachu.generate('ピカチュウ', "でんき", "", 100, 50)

puts pikachu.name
puts pikachu.type1
puts pikachu.hp
puts pikachu.mp
puts pikachu.attack

# 名前やステータスは変更できない(カプセル化)
# pikachu.name = 'ピチュー'
# puts pikachu.name
# pikachu.hp = 300
# puts pikachu.hp
