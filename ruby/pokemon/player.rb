class Player
  attr_reader :name

  def initialize
    generate(name)
  end

  def generate(_name)
    raise '抽象メソッドが呼ばれました'
  end
end
