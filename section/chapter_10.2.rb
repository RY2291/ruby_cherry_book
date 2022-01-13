# yieldを使ってブロックの処理を呼び出す
  def greeting
    puts "good mornig"
    yield
    puts "good eveing"
  end

  greeting do
    puts "hello"
  end

  # yieldを複数回使用 => ブロックが2回呼ばれる
  def greeting
    puts "good morning"
    yield
    yield
    puts "good eveing"
  end

  greeting do
    puts "hello"
  end
p "=========="
  # ブロックが渡されているかどうかは、block_given?メソッドを使用する
  def greeting
    puts "good morning"
    if block_given?
      yield
    end
    puts "good eveing"
  end

  greeting
  greeting do
    puts "hello"
  end

  # yeildに引数を渡したり、ブロックの戻り値を受け取る事ができる
  def greeting
    puts "おはよう"
    text = yield "こんにちは"
    puts text
    puts "こんばんは"
  end

  greeting do |text|
    text * 2
  end

# ブロックを引数として明示的に受け取る
  # ブロックを引数として受け取る場合は、引数名の前に&をつけ、ブロックの実行時にcallメソッドを使う。
  def greeting(&block)
    puts "good morning"
    text = block.call("こんにちは")
    puts text
    puts "こんばんは"
  end

  greeting do |text|
    text * 2
  end