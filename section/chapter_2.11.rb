# デフォルト付き引数
  # デフォルト引数がある場合は、引数がなしでも実行可能
  def greeting(country = "japan")
    if country == "japan"
      "こんにちは"
    else
      "hello"
    end
  end
  puts greeting

  # デフォルト引数には固定値だけでなく、動的に変わる値うや、他のメソッドの戻り値を指定することができる
  def foo(time = Time.now, message = bar)
    puts "time: #{time}, message: #{message}"
  end

  def bar
    "Bar"
  end
  puts foo

  # !や?はメソッドに付けることができ、変数には付けることができない
  