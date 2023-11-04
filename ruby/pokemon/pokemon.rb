class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  def initialize(name, type1, type2, hp, mp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  def attack
    puts "#{@name}のこうげき！"
  end
end
