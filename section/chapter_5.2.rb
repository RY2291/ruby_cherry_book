# ハッシュ
  # Hashクラスのオブジェクト

  # 同じキーが複数使用された場合は、最後に出てきた値が有効になる
  p a = { "japan" => "yen", "japan" => "円"}

  # 新しいキーと値の追加
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  currencies["italy"] = "euro"
  p currencies
  
  # キーが既に存在していた場合は、値が上書きされる
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  currencies["japan"] = "円"
  p currencies
  
  # ハッシュから値を取り出す
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  p currencies["us"]
  
  # ハッシュを使用した繰り返し処理
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  currencies.each do |key, value|
    puts "#{key} : #{value}"
  end
  
  # ブロック引数を１つにするとキーと値が配列に格納される
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  currencies.each do |key_value|
    key = key_value[0]
    value = key_value[1]
    puts "#{key} : #{value}"
  end

  # ハッシュの同値比較
  a = { "x" => 1, "y" => 2, "z" => 3}
  b = { "x" => 1, "y" => 2, "z" => 3}
  p a == b
  
  # 要素数の取得
  a = { "x" => 1, "y" => 2, "z" => 3}
  p a.size
  
  # 要素の削除
  currencies = { "japan" => "yen", "us" => "dollar", "india" => "a"}
  currencies.delete("japan")
  p currencies
  
    # ブロックを渡すとキーが見つからない時の戻り値を作成できる
    currencies.delete("japan") { |key| puts "Not found #{key}"}

