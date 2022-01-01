# シンボル
  # 任意の文字列と１対１に対応するオブジェクト。文字列の代わりに使用することが可能だが、
  # 必ずしも文字列と同じ振る舞いをする訳ではない。

  # Symbolクラスのオブジェクト
  p :apple.class

  # シンボルはRubyの内部で整数で管理されている。文字列よりも高速に比較できる
  p "apple" == "apple"
  p :apple == :apple

  # 同じシンボルであればまたっく同じオブジェクト
  p :apple.object_id
  p :apple.object_id
  p :apple.object_id

  p "apple".object_id
  p "apple".object_id

  # シンボルはイミュータブルなオブジェクトなので、名前なので誰かによって勝手に変更されたくない時などに使用
  string = "apple"
  p string.upcase!
  
  symbol = :apple
  p symbol.upcase!