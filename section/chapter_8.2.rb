# モジュール
  # モジュールからインスタンスを作成する事ができない
  # ほかのモジュールやクラスを継承することはできない

  module Greeter
    def hello
      "hello"
    end
  end
  greeter = Greeter.new

  module AwesomeGreter < Greeter
  end