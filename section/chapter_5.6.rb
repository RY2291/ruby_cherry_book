# ハッシュで使用頻度が高いメソッド
  # keysメソッド
    # ハッシュのキーを配列として返す
    currencies = { japan: "yen", us: "dollor", india: "rupee"}
    p currencies.keys
    
  # valuesメソッド
    # ハッシュの値を配列として返す
    currencies = { japan: "yen", us: "dollor", india: "rupee"}
    p currencies.values
    
  # has_key?メソッド(key?, include?, member?)
    # ハッシュの中に指定されたキーが存在するかどうかを確認するメソッド
    currencies = { japan: "yen", us: "dollor", india: "rupee"}
    p currencies.has_key?(:japan)
    p currencies.include?(:india)

# **でハッシュを展開させる
  # **をハッシュの前に付けるとハッシュリテラル内で他のハッシュのキーと値を展開することができる
  h = { us: "dollor", india: "rupee" }
  { japan: "yen", **h } # => { japan: "yen", us: "dollor", india: "rupee"}
  
  # **の代わりにmergeメソッドを使用しても同じ結果になる
  h = { us: "dollor", india: "rupee" }
  p  = { japan: 'yen' }.merge(h)
  p p


# ハッシュを使った擬似キーワード引数
  def buy_bugger(menu, options = {})
    drink = options[:drink]
    potato = options[:potato]
    p "#{drink} & #{potato}"
  end
  buy_bugger("cheese", drink: true, potato: true)

  # 擬似キーワード引数の場合はどんなキーワードを指定してもエラーにならない(無効なキーをエラーにするためには明示的な実装が必要)
  # buy("fish", salad: true)

# 任意のキーワードを受け付ける**引数
  # 任意のキーワードも同時に受け付ける際は、**をつけた引数を最後につける。キーワード引数に指定されていないキーワードがハッシュとして格納される。
def buy_bugger(menu, drink: true, potato: true, **others)
  puts others
end
buy_bugger("fish", drink: true, potato: true, salad: true, desert: true)

# メソッド呼び出し時の{}の省略
  # Rubyでは、最後の引数がハッシュであればハッシュリテラルの{}を省略できる
  def buy_bugger(menu, options = {})
    puts options
  end
  buy_bugger("fish", { "drink" => true, "potato" => false})
  # ↓省略
  buy_bugger("fish", "drink" => true, "potato" => false)
  

# ハッシュリテラルの{}とブロックの{}
  # 第一引数にハッシュの{}が来る場合は、{}を省略できない
  # buy_bugger { drink: true, potato: true }, "finsh" =>エラー

  # 第2引数以降にハッシュが来る場合は()を省略してもエラーにならない
  buy_bugger "finsh", { drink: true, potato: true }
  # 最後がハッシュなので、{}を省略することができる
  buy_bugger "finsh", drink: true, potato: true

# ハッシュから配列へ、配列からハッシュへ
  # to_aメソッドでハッシュから配列に変換
  currencies = { japan: "yen", us: "dollor", india: "rupee"}
  p currencies.to_a

  # to_hメソッドで配列をハッシュに変換
  array = [[:japan, "yen"], [:us, "dollor"], [:india, "rupee"]]
  p array.to_h

# ハッシュの初期値を理解する
  # ハッシュに対して存在しないキーを指定するとnilが返る
  # nil以外の値を返したい時は、Hash.newでハッシュを作成し、引数に初期値となる値を返す
  h = Hash.new("hello")
  p h[:foo]