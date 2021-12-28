# 変数の参照
  # Rubyの変数には、オブジェクトへの参照が格納されている。変数を他の変数に代入しても、新しい変数は元の変数と同じオブジェクトを参照する
  a = "hello"
  b = "hello"
  puts a.object_id
  puts b.object_id
  c = b
  puts c.object_id

  def m(d)
    d.object_id
  end
  puts m(c)

  # 同じオブジェクトを参照している場合、オブジェクトの状態が変更されると、変更が各変数に影響を与える
  e = "hello"
  f = "hello"
  g = f

  def m(h)
    h.upcase!
  end
  puts m(g)
  puts f
  puts e

# 組み込みライブラリー、標準ライブラリー、gem
  # 標準ライブラリー、gem,自作のクラス定義を使用する際は、require を使用する。1回しか読み込まない.
  # load を使用すると毎回読み込みが可能