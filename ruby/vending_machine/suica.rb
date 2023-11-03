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

  def purchase(vendingmachine, card, juice)
    raise "Suicaの残高が足りないため#{juice.name}は買えません" if card.balance < juice.price
    raise "在庫の数が足りないため#{juice.name}は買えません" if vendingmachine.stocks[juice] == 0
    @balance -= juice.price
    vendingmachine.stocks[juice] -= 1
  end
end
