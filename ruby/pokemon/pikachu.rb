class Pikachu < Pokemon

  def generate(name, type1, type2, hp, mp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  def attack
    super
    "#{@name}の10万ボルト!"
  end
end
