# 配列の多重代入
  a, b = [1,2]
  puts a
  puts b

# 戻り値を配列のまま受け取る
  quo_rem = 14.divmod(3)
  puts "商＝#{quo_rem[0]}, 余り=#{quo_rem[1]}"
  
  # 多重代入として別々の変数で受け取る
  quotient, remainder = 14.divmod(3)
  puts "商＝#{quotient}, 余り=#{remainder}"
