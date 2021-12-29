# |n|はブロック引数  do ~ endまでがブロックの範囲　
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
puts sum

# 配列の要素を削除する条件を自由に指定する
  a = [1, 2, 3, 1, 2, 3]
  a.delete(2)
  p a

# 配列から値が奇数だけを削除
  # delete_if => 配列を順番に取り出し、ブロックの戻り値が真になった要素を全部削除する
  b = [1, 2, 3, 1, 2, 3]
  b.delete_if do |m|
    m.odd?
  end
  p b

# ブロック引数を使用しない場合は省略が可能
  # numbers.each do
  #   sum += 1
  # end

# ブロック引数の名前をブロック外の変数の名前と同じにすると、ブロック内ではブロック引数の値が優先される
  sum += 0
  sum_value = 100
  numbers.each do |sum_value|
    sum += sum_value
  end
p sum

# do ~ endの代わりに{}を使用する
numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n }
puts sum


# 1行でコンパクトに書く時　=> {}
# 改行を含む長いブロックを書く時　=> do ~ end
