# timesメソッド=> 配列を使用せずに、n回処理を繰り返す
  # ブロック引数を省略できる
  sum = 0
  5.times { sum += 1 }
  p sum

# uptoメソッドとdowntoメソッド
  # nからｍまで数値を１つずつ増やしながら何か処理をする
  a = []
  10.upto(14) { |n| a << n}
  p a

  # nからｍまで数値を１つずつ減らしながら何か処理をする
  a = []
  10.downto(6) { |n| a << n}
  p a

# stepメソッド
  # nからｍまで数値をｘ個ずつ増やしながら何か処理をする
  # 開始値.step(上限値、１度に増減する大きさ)
  a = []
  1.step(10, 3) { |n| a << n}
  p a

  # 減らす場合
  a = []
  10.step(1, -3) { |n| a << n}
  p a

# 繰り返し処理用の構文
  # while
  a = []
  while a.size < 5
    a << 1
  end
  p a
    # 1行でかく
    a = []
    a << 2 while a.size < 5
    p a

    # どんな条件でも最低1回実行するｘ
    a = []
    begin
      a << 3
    end while false
    p a