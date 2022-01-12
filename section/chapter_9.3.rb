# 意図的に例外を発生させる
  # raiseメソッドで例外を発生させる

  def currency_of(country)
    case country
    when :japan
      "yen"
    when :us
      "dollor"
    when :india
      "rupee"
    else
      raise "無効な国名です。#{country}"  # 文字列がエラーメッセージになる
    end
  end

  p currency_of(:japan)
  # p currency_of(:korea)

  # raiseメソッドの第１引数に例外、第２引数にエラーメッセージを渡すとその例外クラスで例外を発生させる事ができる
  def currency_of(country)
    case country
    when :japan
      "yen"
    when :us
      "dollor"
    when :india
      "rupee"
    else
      raise ArgumentError, "無効な国名です。#{country}"  
    end
  end

  p currency_of(:korea)