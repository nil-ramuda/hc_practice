class Pokemon
  attr_reader :name, :type1, :type2, :hp, :mp

  def initialize
    generate(name, type1, type2, hp, mp)
  end

  def generate(_name, _type1, _type2, _hp, _mp)
    raise '抽象メソッドが呼ばれました'
  end

  def attack
    "#{@name}のこうげき！"
  end
end
