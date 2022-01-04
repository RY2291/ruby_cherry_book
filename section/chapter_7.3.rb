# initializeメソッド
  # インスタンスを初期化するために実行したい処理があれば、その処理を実行する。外部からの呼び出しはできない（デフォルトでprivateメソッドになっている）。
  class User
    def initialize
      puts "Initialized."
    end
  end
  User.new
  # User.initialize

  # initializeメソッドに引数を付けると、newメソッドを呼ぶ時にも引数が必要になる
  # class User
  #   def initialize(name, age)
  #     puts "name: #{name}, age: #{age}"
  #   end
  # end
  # User.new("Alice", 20)

# インスタンスメソッド
  # クラス内でメソッドを定義すると、そのメソッドはインスタンスメソッドになる。
  class User
    def hello
      puts "Hello!"
    end
  end
  user = User.new
  user.hello # インスタンスメソッドの呼び出し

# クラスメソッドの定義
  # インスタンスメソッドはそのクラスのインスタンスに対して呼び出すことができるメソッドであり、インスタンスに含まれるデータを
  # 読み書きする場合はインスタンスメソッドを定義する
  class User
    def initialize(name)
      @name = name
    end

    def hello # インスタンスメソッド
      puts "Hello, I am #{@name}"
    end
  end
  alice = User.new("Alice")
  alice.hello # インスタンスメソッドはインスタンス（オブジェクト）に対して呼び出す

  bob = User.new("Bob")
  bob.hello # インスタンスによって内部のデータが異なるので、helloメソッドの結果も異なる

  p "---------"
  # クラスメソッドを定義する方法は、メソッドの前にself.を付ける
  class User
    def initialize(name)
      @name = name
    end

    def self.create_users(names)
      names.map do |name|
        User.new(name)
      end
    end

    def hello
      puts "Hello, I am #{@name}"
    end
  end
  names = ["Alice", "Bob", "Carol"]
  users = User.create_users(names)
  users.each do |user|
    puts user.hello
  end

# 定数 => 必ず大文字で始める
class Product
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end
product = Product.new("A free movie")
p product.price

