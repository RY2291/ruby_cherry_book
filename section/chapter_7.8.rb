# 定数
  # クラスの外部から直接参照する事が可能。　クラス名::定数名
  class Product
    DEFAULT_PRICE = 0
  end
  p Product::DEFAULT_PRICE

  # 定数はメソッドの内部で作成する事ができない。必ずクラス構文の直下で作成する必要がある。
  class Product
    DEFAULT_PRICE = 0
  end

  # 定数と再代入
    # 定数は再代入が可能。
    class Product
      DEFAULT_PRICE = 0
      DEFAULT_PRICE = 100
    end

    # クラス外部からでも再代入が可能
    Product::DEFAULT_PRICE = 3000

    # クラスの外部から再代入を防ぐには、freezeを使用。
    Product.freeze
    Product::DEFAULT_PRICE = 5000

    # ミュータブルなオブジェクトに注意する
      # ミュータブルなオブジェクトであれば、定数の値を変更することができる
      class Product
        NAME = "A product"
        SOME_NAMES = ["Foo", "Bar", "Baz"]
        SOME_PRICES = { "Foo" => 1000, "Bar" => 2000, "Baz" => 3000 }
      end

      p Product::NAME.upcase! #=> "A product"
      
      Product::SOME_NAMES << "Hoge"
      p Product::SOME_NAMES # => ["Foo", "Bar", "Baz", "Hoge"]
      