require './juice.rb'
require './suica.rb'
require './vendingmachine.rb'

pepsi = Juice.new('ペプシ', 150)
monster = Juice.new('モンスター', 230)
irohasu = Juice.new('いろはす', 120)

# 初期状態でSuicaに500円がチャージされている
suica = Suica.new
puts "Suicaの残高は#{suica.balance}円です"
# Suicaにチャージ
  # 100円チャージ
  suica.charge(100)
  # 100円未満をチャージしようとするとエラー発生
  # suica.charge(50)
# Suicaの残高取得
puts "Suicaの残高は#{suica.balance}円です"

# 初期状態でペプシを5本格納
vendingmachine = VendingMachine.new(pepsi, 5)
# ジュースの在庫を取得する
puts "#{pepsi.name}の在庫は#{vendingmachine.stocks[pepsi]}本です"

# ペプシを購入
vendingmachine.purchase(suica, pepsi)
# Suicaの残高から購入したジュースの値段分を減らす
suica.balance_subtraction(pepsi)
# Suicaの残高取得
puts "Suicaの残高は#{suica.balance}円です"
# 売上金取得
puts "自動販売機の売上金は#{vendingmachine.sales}円です"
# ジュースの在庫を取得
puts "#{pepsi.name}の在庫は#{vendingmachine.stocks[pepsi]}本です"

# モンスターといろはすをあとから追加
vendingmachine.add_item(monster, 5)
vendingmachine.add_item(irohasu, 5)
# ジュースの在庫を取得
puts "#{monster.name}の在庫は#{vendingmachine.stocks[monster]}本です"
puts "#{irohasu.name}の在庫は#{vendingmachine.stocks[irohasu]}本です"
# モンスターを購入する
vendingmachine.purchase(suica, monster)
# Suicaの残高から購入したジュースの値段分を減らす
suica.balance_subtraction(monster)
# Suicaの残高取得
puts "Suicaの残高は#{suica.balance}円です"
# 売上金取得
puts "自動販売機の売上金は#{vendingmachine.sales}円です"
# ジュースの在庫を取得
puts "#{monster.name}の在庫は#{vendingmachine.stocks[monster]}本です"

# 購入可能なジュースを表示する
vendingmachine.purchasable_juice_list(suica)
puts "購入可能なジュースは#{vendingmachine.purchasable_juice}です"

# Suicaの残高では足りないジュースを購入しようとするとエラー発生
# vendingmachine.purchase(suica, monster)

# モンスターの在庫を10本補充する
vendingmachine.add_stock(monster, 10)
# ジュースの在庫を取得する
puts "#{monster.name}の在庫は#{vendingmachine.stocks[monster]}本です"

# Suicaに1000円チャージ
suica.charge(1000)
# Suicaの残高取得
puts "Suicaの残高は#{suica.balance}円です"
# ペプシをあるだけ購入(４本)
vendingmachine.purchase(suica, pepsi)
vendingmachine.purchase(suica, pepsi)
vendingmachine.purchase(suica, pepsi)
vendingmachine.purchase(suica, pepsi)
# Suicaの残高から購入したジュースの値段分を減らす
suica.balance_subtraction(pepsi)
suica.balance_subtraction(pepsi)
suica.balance_subtraction(pepsi)
suica.balance_subtraction(pepsi)
# Suicaの残高取得
puts "Suicaの残高は#{suica.balance}円です"
# 売上金取得
puts "自動販売機の売上金は#{vendingmachine.sales}円です"
# ジュースの在庫を取得：ペプシはすべて買ったので０本
puts "#{pepsi.name}の在庫は#{vendingmachine.stocks[pepsi]}本です"
# # 在庫がないジュースを購入しようとするとエラー発生
# vendingmachine.purchase(suica, pepsi)
