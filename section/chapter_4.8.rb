# 添字付きの繰り返し処理
  # each_with_index => 繰り返し処理をしつつ、処理している添字を取得できる。 引数を渡すことはできない
                      # ブロック引数の第2引数に添字を渡す
  fruits = ["apple", "orange", "melon"]
  fruits.each_with_index { |fruits, i| puts "#{i}: #{fruits}"}
  
  # with_index => 繰り返し処理での添字を同時取得
  fruits = ["apple", "orange", "melon"]
  p fruits.map.with_index { |fruits, i| "#{i}: #{fruits}" }
  
  # delete_if => 配列を順番に取り出し、ブロックの戻り値が真になった要素を全部削除して返す
  fruits = ["apple", "orange", "melon"]
  p fruits.delete_if.with_index { |fruits, i| fruits.include?("a") && i.odd? }
  
  # 添字を０以外の数値から開始させる
  fruits = ["apple", "orange", "melon"]
  # 1から始まる添字を取得する
  fruits.each.with_index(1) { |fruits, i| puts "#{i}: #{fruits}"}
  
  # 10から始まる添字を取得する
  fruits = ["apple", "orange", "melon"]
  p fruits.map.with_index(10) { |fruits, i| "#{i}: #{fruits}" }


# 配列がブロック引数に渡される場合
  dimensions = [
    [10, 20],
    [30, 40],
    [50, 60]
  ]
  areas = []
  dimensions.each do |dimension|
    length = dimension[0]
    width = dimension[1]
    areas << length * width
  end
  p areas
  
  # 配列の要素の数だけブロック引数を用意すると、各要素の値が別々の変数に格納される
  dimensions = [
    [11, 20],
    [30, 40],
    [51, 60]
  ]
  areas = []
  dimensions.each do |length, width|
    areas << length * width
  end
  p areas

# ブロックローカルルール
  # ブロックローカル変数 => ブロック引数を;で区切り、変数を宣言すると、ブロック内のみで有効なローカル変数を生成

  numbers = [1, 2, 3, 4]
  sum = 0
  numbers.each do |n; sum|
    sum = 10 # <=上記のsumとは別の変数
    sum += n
    p sum
  end
  
# do ~ endと{}の結合度の違い
  # do ~ end < {}

  # ブロックを渡さない時は指定した値が見つからないとnilが返る
  a = [1, 2, 3, 4]
  p a.delete(100)
  
  # ブロックを渡すとブロックの戻り値が指定した値が見つからない時の戻り値になる
  a = [1, 2, 3, 4]
  a.delete(100) do 
    "NG"
  end
  p a
