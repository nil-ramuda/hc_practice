score = "パー"
scores = []
lines = []
File.foreach("case_1.txt") do |l|
  s = l.chomp.split(",")
  lines.push(s)
end
lines[0].each_with_index do |x, i|
  d = lines[1][i].to_i - lines[0][i].to_i # Y(規定打数) - X(プレイヤー打数) の値
  case d
  when 1
    score = "ボギー"
  when 0
    score = "パー"
  when -1
    score = "バーディ"
  when -2
    if lines[1][i].to_i == 1
      score = "ホールインワン"
    else
      score = "イーグル"
    end
  when -3
    if lines[0][i].to_i == 4 && lines[1][i].to_i == 1
      score = "ホールインワン"
    else
      score = "アルバトロス"
    end
  when -4
    score = "コンドル"
  else
    score = "#{d}ボギー"
  end
  scores.push(score)
end
puts scores.join(",")


