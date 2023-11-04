class VendingMachine
  attr_reader :sales, :purchasable_juice, :stocks

  def initialize(juice, stock_num)
    @sales = 0
    @stocks = { juice => stock_num}
  end

  def add_item(juice, num)
    @stocks[juice] = num
  end

  def add_stock(juice, num)
    @stocks[juice] += num
  end


  def purchasable_juice_list(card)
    @purchasable_juice = []
    @stocks.each do |juice, stock|
      if card.balance >= juice.price && stock > 0
        @purchasable_juice.push(juice.name)
      end
    end
  end

  def purchase(card, juice)
    raise "Suicaの残高が足りないため#{juice.name}は買えません" if card.balance < juice.price
    raise "在庫の数が足りないため#{juice.name}は買えません" if @stocks[juice] == 0

    stocks[juice] -= 1
    self.purchased_juice = juice
  end

  private
  def purchased_juice=(juice)
    @sales += juice.price
  end
end

