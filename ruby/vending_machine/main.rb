class Juice
  def initialize(name, price)
    @name = name
    @price = price
  end
  def name
    @name
  end
  def price
    @price
  end
end


class Suica
  DEPOSIT = 500

  def initialize
    @balance = DEPOSIT
  end

  def charge(money)
    if money < 100
      raise "100円未満はチャージできません"
    else
      @balance = DEPOSIT + money
    end
  end

  # private
  def balance
    @balance
  end

  def balance=(new_balance)
    @balance = new_balance
  end
end


class VendingMachine
  def initialize(juice, stock_num)
    @purchasable_juice = []
    @sales = 0
    @stocks = { juice.name => stock_num }
  end

  def add_item=(new_juice)
    @stocks[new_juice[0]] = new_juice[1]

  end

  def add_stock(juice, a)
    @stocks[juice.name] += a
  end

  def show_stock
    @stocks
  end

  def purchase(card, juice, num)
    if card.balance >= juice.price * num && @stocks[juice.name] >= num
      card.balance -= juice.price * num
      @sales += juice.price
      @stocks[juice.name] -= num
    else card.balance < juice.price || @stocks[juice.name] < num
      raise "Suicaの残高が足りないか、在庫の数が足りないため#{juice.name}は買えません"
    end
  end


  def purchasable_juice(card, juice)
    if card.balance >= juice.price && @stocks[juice.name] > 0
      @purchasable_juice.push(juice.name)
    end
  end

  def show_purchasable_juice
    @purchasable_juice
  end

  private
  def sales
    @sales
  end
end
