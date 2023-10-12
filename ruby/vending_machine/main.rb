class Suica
  @@deposit = 500
  def charge(money)
    @money = money
    if money < 100
      raise "100円未満はチャージできません"
    else
      @@deposit = 500 + @money
    end
  end

  def balance
    puts "残高は#{@@deposit}円です"
    @@deposit
  end

end

class VendingMachine < Suica
  @@juice_name = "ペプシ"
  @@juice_price = 150
  @@juice_stock = 5

  @@sales = 0
  def purchase_processing(purchaseNum1)
    if @@deposit > @@juice_price * purchaseNum1 && @@juice_stock >= purchaseNum1
      puts "ペプシを#{purchaseNum1}本購入します"
      @@juice_stock -= purchaseNum1
      puts "残りの在庫数：#{@@juice_stock}"
      @@sales += @@juice_price * purchaseNum1
      puts "現在の売上高：#{@@sales}"
      @@deposit -= @@juice_price * purchaseNum1
      puts "Suica残高：#{@@deposit}"
    else @@deposit < @@juice_price * purchaseNum1 || @@juice_stock < purchaseNum1
      raise "Suicaの残高が足りないか、ペプシの在庫が足りません"
    end
  end

end


class FunctionExtension < VendingMachine
  def getJuice(name, price, stock)
    @name = name
    @price = price
    @stock = stock
    puts "#{@name}, #{@price}, #{@stock}"
  end

  def add_juice_name(*names)
    @juice_names = [@@juice_name, names].flatten
  end

  def add_juice_price(*prices)
    @juice_prices = [@@juice_price, prices].flatten
  end

  def add_juice_stock(*stocks)
    @juice_stocks = [@@juice_stock, stocks].flatten
  end

  def drink_list
    @juice_prices.each_with_index do |price, i|
      if price < @@deposit
        @purchasable_drink = @juice_names[i]
      else
        @unpurchasable_drink = @juice_names[i]
      end
    end
  end

  def stock_replenishing(*stockNum)
    @juice_stocks.each_with_index do |st, i|
      @juice_stocks[i] += stockNum[i]
    end
  end

  def purchase_processing(name, purchaseNum2)
    case name
    when "モンスター"
      if @@deposit > 230 * purchaseNum2 && @juice_stocks[0] >= purchaseNum2
        puts "モンスターを#{purchaseNum2}本購入します"
        @juice_stocks[0] -= purchaseNum2
        puts "残りの在庫数：#{@juice_stocks[0]}"
        @@sales += 230 * purchaseNum2
        puts "現在の売上高：#{@@sales}"
        @@deposit -= 230 * purchaseNum2
        puts "Suica残高：#{@@deposit}"
      else @@deposit < 230 * purchaseNum2 || @juice_stocks[0] < purchaseNum2
        raise "Suicaの残高が足りないか、モンスターの在庫が足りません"
      end
    when "いろはす"
      if @@deposit > 120 * purchaseNum2 && @juice_stocks[1] >= purchaseNum2
        puts "いろはすを#{purchaseNum2}本購入します"
        @juice_stocks[1] -= purchaseNum2
        puts "残りの在庫数：#{@juice_stocks[1]}"
        @@sales += 120 * purchaseNum2
        puts "現在の売上高：#{@@sales}"
        @@deposit -= 120 * purchaseNum2
        puts "Suica残高：#{@@deposit}"
      else @@deposit < 120 * purchaseNum2 || @juice_stocks[1] < purchaseNum2
        raise "Suicaの残高が足りないか、いろはすの在庫が足りません"
      end
   end
  end
end

Suica.new.charge(600)
Suica.new.balance
VendingMachine.new.purchase_processing(4)

fe = FunctionExtension.new
fe.add_juice_name("モンスター", "いろはす")
fe.add_juice_price(230, 150)
fe.add_juice_stock(3, 2)
fe.drink_list
fe.stock_replenishing(1, 2, 3)
fe.purchase_processing("いろはす", 2)

