class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  def initialize
    generate(name, type1, type2, hp, mp)
  end

  def generate(name, type1, type2, hp, mp)
    raise '抽象メソッドが呼ばれました'
  end

  def attack
    "#{@name}のこうげき！"
  end
end
