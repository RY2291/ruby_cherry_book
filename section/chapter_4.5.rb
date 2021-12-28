# 範囲オブジェクト
  # 最初の値..最後の値(最後の値を含む)
  # 最初の値...最後の値(最後の値を含まない)

  range = 1..5
  a = range.include?(0)
  p a
  a = range.include?(1)
  p a
  a = range.include?(5)
  p a
  p "-------"
  
  range = 1...5
  a = range.include?(0)
  p a
  a = range.include?(1)
  p a
  a = range.include?(5)
  p a

# 配列や文字列の一部を抜き出す
  a = [1, 2, 3, 4, 5]
  p a[1..3]

  a = "abcdef"
  p a[0..2]

# n以上ｍ以下、ｎ以上ｍ未満の判定
  # 不等号を使う場合
  def liquid?(temperture)
    0 <= temperture && temperture > 100
  end
  p liquid?(-1)

  # 範囲オブジェクト場合
  def liquid?(temperture)
    (0...100).include?(temperture)
  end
  p liquid?(1)

# case文 
  def charge(age)
    case age
      when 0..5
        0
      when 6..12
        300
      when 13..18
        600
      else
        1000
    end
  end
  p charge(3)
  p charge(12)

# 値が連続する配列を作成する
  p (1..5).to_a
  p (1...5).to_a

# 範囲オブジェクトを使用して繰り返し処理をする
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n}
p sum

# 範囲オブジェクトに対して直接eachメッドを呼ぶ
sum = 0
(1..5).each { |n| sum += n}
p sum

