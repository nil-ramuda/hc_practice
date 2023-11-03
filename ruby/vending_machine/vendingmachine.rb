class VendingMachine
  attr_reader :sales, :purchasable_juice

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

  def purchased_juice=(juice)
    @sales += juice.price
  end

  def purchasable_juice_list(card)
    @purchasable_juice = []
    @stocks.each do |juice, stock|
      if card.balance >= juice.price && stock > 0
        @purchasable_juice.push(juice.name)
      end
    end
  end

  def stocks
    @stocks
  end

end
