# シンボルを作成するさまざまな方法
  # :に続けて、変数名やクラス名、メソッド名の識別子として有効な文字列を書きます。
  :apple
  :Apple
  :ruby_is_fun
  :okay?
  :welcom

  # 識別子として無効な文字列（数字で始まったり、ハイフンやスペースが含まれる文字列）を使うとエラーになる
  # :12345
  # :ruby-is-ruby
  # :ruby is fun
  # :()
  # ↓シングルクオートで囲むと有効になる
  :'12345'
  :'ruby-is-ruby'
  :'ruby is fun'
  :'()'

  # ハッシュを作成する際に、"文字列: 値"の形式でかいた場合も":文字列"と同じと見なされ、キーがシンボルになる
  hash = { "abc": 123}
  p hash

  # %sでシンボルを作成する
  p %s!ruby is fun!

  # %iでシンボルの配列を作成する
  p %i(apple orange melon)

    # 改行文字を含めたり、式展開したりする場合は%Iを使う
    name = "Alice"
    p %i(hello\ngood-bye #{name.upcase})
    p %I(hello\ngood-bye #{name.upcase})