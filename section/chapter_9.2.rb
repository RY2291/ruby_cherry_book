# 例外を補足して処理を続行する場合
  # 何らかの例外が発生してもプログラムを続行したい場合は、例外処理を明示的に書くことで、プログラムを続行させる事が可能。

  puts "start"
  module Greeter
    def Hello
      "hello"
    end
  end

  begin
    greeter = Greeter.new   # 例外が起きる処理
  rescue => exception
    puts "例外が発生したが、このまま続行する"  # 例外が発生した場合の処理
  end

  puts "End."

# 例外処理の流れ
  # 例外が発生した場合、呼びだされたメソッドを遡って、例外処理を探し、見つからなかった場合は、例外が発生した場所で処理が止まる.
  def method_1
    puts "method_1 start."
    begin
      method_2
    rescue
      puts "例外が発生しました"
    end
    puts "method_1 end."
  end
  
  def method_2
    puts "method_2 start."
    method_3
    puts "method_2 end."
  end

  def method_3
    puts "method_3 start."
    1 / 0
    puts "method_3 end."
  end

  method_1

# 例外オブジェクトから情報を取得する
  # Rubyでは発生した例外自身もオブジェクトのため、例外オブジェクトのメソッドを呼び出すことで、発生した例外に関する情報を取得できる
  begin
    1 /0
  rescue => e  # 例外オブジェクト格納する変数
    puts "エラークラス: #{e.class}"
    puts "エラーメッセージ: #{e.message}"
    puts "バックトレース"
    puts e.backtrace
    puts "========"
  end

# クラスを指定して補足する例外を限定する
  # 例外オブジェクトのクラスが一致した場合のみ、例外を捕捉することができる
  begin
    1 / 0
  rescue ZeroDivisionError  # 捕捉したい例外クラス
    puts "0で徐算しました"
  end

  # rescue節を複数書くことで、異なる例外クラスに対応することができる。
  begin
    "abc".foo
  rescue ZeroDivisionError
    puts "0で徐算しました"
  rescue NoMethodError
    puts "存在しないメソッドが呼びだされました"
  end

  # 1つのrescue節に複数の例外クラスを指定することもできる
  begin
    "abc".foo
  rescue ZeroDivisionError, NoMethodError
    puts "0で徐算したか存在しないメソッドが呼びだされました"
  end

  # 例外オブジェクトを変数に格納することもできる
  begin
    "abc".foo
  rescue ZeroDivisionError, NoMethodError => e
    puts "0で徐算したか存在しないメソッドが呼びだされました"
    puts "エラー: #{e.class} #{e.message}"
  end

# 例外クラスの継承関係
  # 全ての例外クラスはExceptionクラスを継承しており、その下には多くの例外クラスが”サブクラス”としてある。
  # StandardError => 通常のプログラムで発生する可能性の高い例外を表すクラス。

  # rescue節に何もクラスを指定しない場合はに捕捉されるのは、StandardErrorとそのサブクラス。特殊なエラーは捕捉されない。

# 例外発生時にもう一度処理をやり直すretry
  # 何度か処理をやり直すことで、正常に実行できる可能性がある場合は、rescue節でretry文を実行すると、begin節を最初からやり直しができる。

  retry_count = 0
  begin
    puts "処理を開始します"
    1 /0                                  # 例外が発生するかもしれない処理
  rescue
    retry_count += 1
    if retry_count <= 3
      puts "retryします。(#{retry_count}回目)"
      retry                               # 処理をやり直す
    else
      puts "retryに失敗しました"
    end
  end
