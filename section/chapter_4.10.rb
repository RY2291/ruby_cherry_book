#  break
  # 繰り返し処理を脱出できる
  numbers = [1, 2, 3, 4].shuffle
  numbers.each do |n|
    puts n
    break if n == 4
  end
  
  p "---------"
  # while
  numbers = [1, 2, 3, 4, 5].shuffle
  i = 0
  while i < numbers.size
    n = numbers[i]
    puts n
    break if n == 5
    i += 1
  end
  p "---------"
  
  # 引数を渡さない場合は、戻り値がnil.
  ret =
  while true
    break
  end
  p ret
  
  # breakに引数を渡すと、while文,for文の戻り値になる。
  ret =
  while true
    break 12
  end
  p ret
  
  # 繰り返し処理が入れ子になっている場合、一番内側の繰り返し処理を脱出する
  fruits = ["apple", "orange", "lemon", "melon"]
  numbers = [1, 2, 3, 4]
  fruits.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n} "
      break if n == 3
    end
  end
  
  p "---------"
  # throwとcatchを使った大脱出
  # breakは、一番内側の繰り返し処理しか脱出できないが、throwとcatchは外側のループまで脱出できる
  fruits = ["apple", "orange", "lemon", "melon"]
  numbers = [1, 2, 3, 4]
  catch :done do
    fruits.shuffle.each do |fruit|
      numbers.shuffle.each do |n|
        puts "#{fruit}, #{n}"
        if fruit == "orange" && n == 3
          throw :done
        end
      end
    end
  end
  
  
  # returnとbreaｋの違い
  # break  => 繰り返し処理から脱出
  # return =>　メソッドからの脱出
  
  
  # next
  # 繰り返し処理を途中で中断し、次の繰り返し処理に進める
  numbers = [1, 2, 3, 4]
  numbers.each do |n|
    next if n.even?
    puts n
  end
  
  # while文やfor文などでも使える
  numbers = [1, 2, 3, 4]
  i = 0
  while i < numbers.length
    n = numbers[i]
    i += 1
    next if n.even?
    puts n
  end

  # 入れ子になった繰り返し処理では、一番内側のループだけが中断の対象になる
  fruits = ["apple", "orange", "lemon", "melon"]
  numbers = [1, 2, 3, 4]
  fruits.each do |fruit|
    numbers.each do |n|
      next if n.even?
      puts "#{fruit}, #{n}"
    end
  end

# redo
  # 繰り返し処理をやり直したい場合に使用

  foods = ["トマト", "なす", "キャベツ"]
  count = 0
  foods.each do |food|
    print "#{food}は好きですか？"
    answer = "いいえ"
    puts answer

    count += 1
    redo if answer != "はい" && count < 2

    count = 0
  end