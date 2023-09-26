require 'optparse'
require 'date'

def week
  puts '月 火 水 木 金 土 日'
end

year = [*1..12]

today = Date.today

options = {}
OptionParser.new do |opts|
  opts.on('-m MONTH') do |month|
    options[:month] = month.to_i
  end
end.parse!
month = options[:month] || today.month
if year.include?(month)
  puts "      #{month}月 2023"
  days = [*Date.new(2023, month, 1).day..Date.new(2023, month, -1).day]
  week
  case Date.new(2023, month, 1).cwday
  when 1 # １日が月曜日の場合
    first_week = days.slice(0..6).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts first_week
    other_week = days.slice(7..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 2 # １日が火曜日の場合
    first_week = days.slice(0..5).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 3 + first_week
    other_week = days.slice(6..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 3 # １日が水曜日の場合
    first_week = days.slice(0..4).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 6 + first_week
    other_week = days.slice(5..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 4 # １日が木曜日の場合
    first_week = days.slice(0..3).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 9 + first_week
    other_week = days.slice(4..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 5 # １日が金曜日の場合
    first_week = days.slice(0..2).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 12 + first_week
    other_week = days.slice(3..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 6 # １日が土曜日の場合
    first_week = days.slice(0..1).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 15 + first_week
    other_week = days.slice(2..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  when 7 # １日が日曜日の場合
    first_week = days.slice(0..0).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
    puts ' ' * 18 + first_week
    other_week = days.slice(1..-1)
    other_week.each_slice(7) do |a|
      puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
    end
  end
else
  puts "#{month}  is neither a month number (1..12) nor a name"
end
