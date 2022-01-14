# Procオブジェクト
  # Procクラスはブロックをオブジェクト化するためのクラス。Procオブジェクトを作成する際は、Proc.newにブロックを渡す。
  hello_proc = Proc.new do
    "Hello"
  end

  # do ~ endの代わりに{}を使える
  hello_proc = Proc.new { "Hello!" }

  # Procオブジェクトを実行する際は、callメソッドを使用する
  p hello_proc.call

  add_proc = Proc.new { |a, b| a + b}
  p add_proc.call(10, 20)

  add_proc = Proc.new { |a = 0, b = 0| a + b }
  p add_proc.call
  p add_proc.call(1, 2)

  # Procオブジェクトを作成する際は、Kernelモジュールのprocメソッドも使用できる
  add_proc = proc { |a, b| a + b }

# Procオブジェクトをブロックの代わりに渡す
  # 引数のblockはProcオブジェクトである

  # 引数にブロック引数を使用
  def greeting(&block)
    puts "good morning"
    text = block.call("こんにちは")
    puts text
    puts "こんばんは"
  end

  greeting do |text|
    text * 2
  end

  # 引数にProcオブジェクトを渡す。　引数に＆がついていないとブロックではなく、普通の引数になってしまう
  def greeting(&block)
    puts "おはよう"
    text = block.call("こんにちは")
    puts text
    puts "こんばんは"
  end

  repeat_proc = Proc.new { |text| text * 2 }
  greeting(&repeat_proc)

# Procオブジェクトを普通の引数として渡す
  # ブロックではなく、１個のProcオブジェクトを引数として受け取る（＆をつけない）
  def greeting(arrange_proc)
    puts "good moring"
    text = arrange_proc.call("hello")
    puts text
    puts "good eveing"
  end

  repeat_proc = Proc.new { |text| text * 2 }
  greeting(repeat_proc)

  # 複数のProcオブジェクトを受け取る
  def greeting(proc_1, proc_2, proc_3)
    puts proc_1.call("おはよう")
    puts proc_2.call("こんにちは")
    puts proc_3.call("こんばんわ")
  end

  shuffle_proc = Proc.new { |text| text.chars.shuffle.join }
  repeat_proc = Proc.new { |text| text * 2 }
  question_proc = Proc.new { |text| "#{text}?"}

  greeting(shuffle_proc, repeat_proc, question_proc)

# Proc.newとラムダの違い
  # ->構文とlambdaメソッド(Procオブジェクトの作成)
  ->(a, b) { a + b }
  lambda { |a, b| a + b }

    # 引数がなければ省略可能
    -> { "hello" }

    # ブロックを使用する際は改行が可能
    ->(a, b) {
      a + b
    }

  # 引数の個数があっていないといけない
  add_proc = Proc.new { |a, b| a.to_i + b.to_i }
  p add_proc.call(10, 20, 100)

  add_lamda = ->(a, b) { a.to_i + b.to_i }
  # add_lamda.call(10)

# Proc.newかラムダかを判断するlambda?メソッド
    # Proc.new
    add_proc = Proc.new { |a, b| a + b }
    p add_proc.class
    p add_proc.lambda?

    # ラムダの場合
    add_lamda = ->(a, b) { a + b }
    p add_lamda.class
    p add_lamda.lambda?