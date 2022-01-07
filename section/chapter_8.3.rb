# モジュールをクラスにincludeする
  # is-aの関係が成り立たたず、継承が使用できない場合は、モジュールを使用して、共通機能を持たせる。
  # モジュールをクラスにincludeして機能を追加すること。
  module Loggable
    def log(text)
      puts "[LOG] #{text}"
    end
  end

  class Product
    include Loggable

    def title
      log "title is called"
      "A great movie"
    end
  end

  class User
    include Loggable

    def name
      log "name is called."
      "Alice"
    end
  end

  product = Product.new
  p product.title

  user = User.new
  p user.name

# モジュールをextendする
  # モジュール内のメソッドをそのクラスの特異メソッド（クラスメソッド）にする事ができる
  module Loggable
    def log(text)
      puts "[LOG] #{text}"
    end
  end

  class Product

    extend Loggable

    def self.create_products(names)
      # logメソッドをクラスメソッド内で呼び出すことで、logメソッド自体もクラスメソッドになっている。
      log "create_products is called."
    end
  end

  Product.create_products([])
  Product.log("Hello.")