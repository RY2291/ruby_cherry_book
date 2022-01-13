# ensure
  # 例外が発生してもしなくても必ず実行したい処理がある場合に、ensure節を使用する
  file = File.open("some.txt", "w")

  begin
    file << "Hello"  # 例外が発生するかもしれない処理
  ensure
    file.close       # 例外の有無に関わらず実行する処理
  end

# ensureの代わりにブロックを使用する
File.open("some.txt", "w") do |file|
  file << "Bye"
end


# 例外処理のelse
  # 例外が発生しなかった場合に実行される
  begin
    puts "hello"
  rescue
    puts "例外が発生しました"
  else
    puts "例外は発生しませんでした"
  end

# 例外処理と戻り値
  # 例外が発生せず、最後まで正常に処理が進んだ場合はbegin節の最後の式が戻り値になる

  # 正常に終了した場合
  ret =
    begin
      "OK"
    rescue 
      "error"
    ensure
      "ensure"
    end
  p ret

  # 例外が発生した場合
  ret =
    begin
      1 / 0
      "OK"
    rescue 
      "error"
    ensure
      "ensure"
    end
  p ret

  # ensure節にreturnを使用すると、正常時も例外時もensureの値がメソッドの戻り値になる
  def some_method(n)
    begin
      1 / 0
      "OK"
    rescue 
      "error"
    ensure
      return "ensure"
    end
  end

  p some_method(1)
  p some_method(0)

# begin/endを省略するrescue装飾子
  # 例外が発生しそうな処理 rescue 例外が発生した時の戻り値

  p 1 / 1 rescue 0
  p 1 / 0 rescue 2

  require "date"

  def to_date(string)
    begin
      Date.parse(string)
    rescue ArgumentError
      nil
    end
  end
  
  p to_date("2022-01-13")
  p to_date("abcd")
  
  def to_date(string)
    Date.parse(string) rescue nil
  end

  p to_date("2022-01-13")
  p to_date("abcd")

# $!と$@に格納される例外情報
  # 最後に発生した例外は"$!"に組み込まれる
  # バックトレース情報は"$@"に組み込まれる
  begin
    1 / 0
  rescue
    puts "#{$!.class} #{$!.message}"
    puts $@
  end