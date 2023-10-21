class Juice
  # 名前と値段をインスタンス変数に入れる
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
  # 預り金を定義する
  DEPOSIT = 500
  def initialize
    @balance = DEPOSIT
  end
  # チャージ
  def charge(money)
    if money < 100
      raise "100円未満はチャージできません"
    else
      @balance = DEPOSIT + money
      puts "残高は#{@balance}円です"
    end
  end

  private
  # 残高取得
  def balance
    # puts "残高は#{@balance}円です"
    @balance
  end

  
end


class VendingMachine
  def initialize(juice, stock_num)
    # 売上金を定義する
    @sales = 0
    # 在庫を定義する
    @stocks = { juice.name => stock_num }
  end

  # ジュース追加
  def add_item=(new_juice)
    # @stocks = {juice.name => num}
    # @stocks[juice.name] = num
    # puts "#{juice.name}の在庫は#{@stocks[juice.name]}本です"
    @stocks[new_juice[0]] = new_juice[1]

  end
  # 在庫補充
  # def add_stock(juice, a)
  #   @stocks[juice.name] += a
  #   puts @stocks[juice.name]
  # end

  def show_stock
    puts @stocks
  end
  # 支払処理
  # どのジュースのボタンが押されたか感知する
  # Suicaの支払い処理
  def purchase(card, juice)
    if card.balance >= juice.price && @stocks[juice.name] > 0
      # puts "#{juice.name}は買えます"
      @sales += juice.price
      # puts "売上金が#{@sales}円になりました"
      @stocks[juice.name] -= 1
      # puts "#{juice.name}は残り#{@stocks[juice.name]}本です"
    else card.balance < juice.price || @stocks[juice.name] == 0
      puts "#{juice.name}は買えません"
    end
  end


  def purchasable_juice(card, juice)
    if card.balance >= juice.price && @stocks[juice.name]
      puts "#{juice.name}は買えます"
    end
  end

  private
  def sales
    # p @sales
    puts "売上金は#{@sales}円です"
  end
end

pepsi = Juice.new("ペプシ", 150)
suica = Suica.new
suica.charge(100)
# suica.balance
vendingmachine = VendingMachine.new(pepsi, 5)
# vendingmachine.stock(pepsi, 5)
vendingmachine.purchase(suica, pepsi)
# vendingmachine.add_stock(pepsi, 2)
# vendingmachine.sales
monster = Juice.new("モンスター", 230)
irohasu = Juice.new("いろはす", 120)
# vendingmachine.stock(monster, 5)
vendingmachine.add_item = [monster.name, 5]
# vendingmachine.add_item(irohasu, 5)
vendingmachine.show_stock
# vendingmachine.add_stock(monster, 3)
vendingmachine.purchasable_juice(suica, pepsi)
# vendingmachine.add_stock(monster, 5)
