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

raise "#{month} is neither a month number (1..12) nor a name" unless year.include?(month)

puts "      #{month}月 2023"
days = [*Date.new(2023, month, 1).day..Date.new(2023, month, -1).day]
week
cwday = Date.new(2023, month, 1).cwday
first_week = days.slice(0..(7 - cwday)).map { |day| day.to_s.rjust(2, ' ') }.join(' ')
puts '   ' * (cwday - 1) + first_week
other_week = days.slice((7 - cwday + 1)..-1)
other_week.each_slice(7) do |a|
  puts a.map { |b| b.to_s.rjust(2, ' ') }.join(' ')
end
