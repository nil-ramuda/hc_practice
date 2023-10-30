require './juice.rb'
require './suica.rb'
require './vendingmachine.rb'

# ジュースのインスタンスを生成
pepsi = Juice.new('ペプシ', 150)
monster = Juice.new('モンスター', 230)
irohasu = Juice.new('いろはす', 120)


# Suicaのインスタンスを生成
suica = Suica.new
# Suicaチャージ
  # 100円以上をチャージした場合
  suica.charge(200)
  # 100円未満をチャージした場合例外発生
  # suica.charge(50)
# Suicaの残高取得
puts suica.balance

# 自動販売機に初期状態でペプシを５本格納する
vendingmachine = VendingMachine.new(pepsi, 5)
# ジュースの在庫を取得する
puts vendingmachine.show_stock
# 購入処理
  # ペプシを1本購入する
  vendingmachine.purchase(suica, pepsi, 1)
  # suica.purchase(suica, pepsi, 1)
  # ペプシを6本購入しようとすると例外発生
  # vendingmachine.purchase(suica, pepsi, 6)
  # 合計金額がSuicaの残高より多いと例外発生
  # vendingmachine.purchase(suica, pepsi, 5)
# ジュースの在庫を取得する
puts vendingmachine.show_stock

# モンスター５本をを追加する
vendingmachine.add_item = [monster.name, 5]
# いろはす５本を追加する
vendingmachine.add_item = [irohasu.name, 5]
# ジュースの在庫を取得する
puts vendingmachine.show_stock

# 在庫を補充する
  # ペプシ１本、モンスター10本、いろはす3本を追加する
  vendingmachine.add_stock(pepsi, 1)
  vendingmachine.add_stock(monster, 10)
  vendingmachine.add_stock(irohasu, 3)
# ジュースの在庫を取得する
puts vendingmachine.show_stock

# モンスターを1本購入する
vendingmachine.purchase(suica, monster, 1)
# ジュースの在庫を取得する
puts vendingmachine.show_stock
# いろはすを1本購入する
vendingmachine.purchase(suica, irohasu, 1)
# ジュースの在庫を取得する
puts vendingmachine.show_stock
# 残高
puts suica.balance

# 購入可能か判定する
vendingmachine.purchasable_juice(suica, pepsi)
vendingmachine.purchasable_juice(suica, monster)
vendingmachine.purchasable_juice(suica, irohasu)
p vendingmachine.show_purchasable_juice
