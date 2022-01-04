# ハッシュのキーには、シンボルが適している
  currencies = { :japan => "yen", :us => "dollor", :india => "rupee"}

# シンボルを使用して値を取り出す
p currencies[:japan]

# シンボルがキーになる場合は、”シンボル: 値”という記法でハッシュを作成できる
currencies = { japan: "yen", us: "dollor", india: "rupee"}
p currencies[:japan]

# メソッドのキーワード引数とハッシュ
  def buy_bugger(menu, drink, potato)
    if drink
    end
    if potato
    end
  end
  buy_bugger("cheese", true, true)

  # ↑は第2、３引数が何を表しているか、分からないため、キーワード引数を使うと可読性が上がる
  def buy_bugger(menu, drink: true, potato: true)
  end

  # キーワード引数にはデフォルト値が設定されているので、省略可能
  buy_bugger(cheese, potato: false)

  # キーワード引数と一致するハッシュであれば、メソッドの引数として渡すことができる
  params = { drink: true, potato: false}
  buy_bugger("fish", params)

