class VendingMachine

  def initialize(juice, stock_num)
    @purchasable_juice = []
    @sales = 0
    @stocks = { juice.name => stock_num }
  end

  def add_item=(new_juice)
    @stocks[new_juice[0]] = new_juice[1]
  end

  def add_stock(juice, num)
    @stocks[juice.name] += num
  end

  def show_stock
    @stocks
  end

  def purchase(card, juice, num)
    raise "Suicaの残高が足りないため#{juice.name}は買えません" if card.balance < juice.price * num
    raise "在庫の数が足りないため#{juice.name}は買えません" if @stocks[juice.name] < num

    card.balance -= juice.price * num
    @sales += juice.price
    @stocks[juice.name] -= num
  end

  def purchasable_juice(card, juice)
    if card.balance >= juice.price && @stocks[juice.name] > 0
      @purchasable_juice.push(juice.name)
    end
  end

  def show_purchasable_juice
    @purchasable_juice
  end

  # private

  attr_reader :sales
end
