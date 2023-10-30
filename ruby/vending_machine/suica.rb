class Suica
  # private
  attr_reader :balance

  DEPOSIT = 500

  def initialize
    @balance = DEPOSIT
  end

  def charge(money)
    raise '100円未満はチャージできません' if money < 100
    @balance = DEPOSIT + money
  end

  def purchase(card, juice, num)
    raise "Suicaの残高が足りないため#{juice.name}は買えません" if card.balance < juice.price * num
    raise "在庫の数が足りないため#{juice.name}は買えません" if @stocks[juice.name] < num
    card.balance -= juice.price * num
    @sales += juice.price
    @stocks[juice.name] -= num
  end
end
