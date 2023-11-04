class Suica
  attr_reader :balance

  def initialize
    @balance = 500
  end

  def charge(money)
    raise '100円未満はチャージできません' if money < 100

    @balance += money
  end

  def balance_subtraction(juice)
    @balance -= juice.price
  end
end
