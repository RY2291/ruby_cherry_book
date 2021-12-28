# map, collect
  # 各要素に対してブロックを評価した結果を新しい配列にして返す
  numbers = [1, 2, 3, 4]
  new_numbers = []
  numbers.each { |n| new_numbers << n * 10}
  p new_numbers

  numbers = [1, 2, 3, 4]
  new_numbers = numbers.map { |n| n * 10 }
  p new_numbers

# select(find_all), reject
  # 各要素に対してブロックを評価し、その戻り値が真の要素を集めた配列を返す
  numbers = [1, 2, 3, 4, 5, 6]
  even_numbers = numbers.select { |n| n.even? }
  p even_numbers

  numbers = [1, 2, 3, 4, 5, 6]
  non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
  p non_multiples_of_three

# find(detect)
  # ブロックの戻り値が真になった最初の要素を返す
  numbers = [1, 2, 3, 4, 5, 6]
  even_numbers = numbers.find { |n| n.even? }
  p even_numbers

# inject(reduce)
  # ブロック引数の第1引数に初回のみ、injectの引数(0)が入り、2回目以降は前回にブロックの戻り値が入る.
    # 第2引数には配列の要素が順番に入る
numbers = [1, 2, 3, 4, 5]
sum = numbers.inject(0) { |result, n| result + n}
p sum

day = ["mon", "tue", "wed", "thu", "fri", "sat"].inject("Sun") { |result, s| result + s.capitalize}
p day