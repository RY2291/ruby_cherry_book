# selfキーワード
  # インスタンス自信を表す。省略可能
  class User
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    # selfなしでnameメソッドを呼ぶ
    def hello
      puts "Hello, I am #{name}."
    end
    
    # selfありでnameメソッドを呼ぶ
    def hi
      puts "Hi, I am #{self.name}"
    end

    def my_name
      puts "My name is #{@name}"
    end
  end
  user = User.new("Alice")
  user.hello
  user.hi
  user.my_name

  # selfのつけ忘れで不具合が発生するケース
  class User
    attr_accessor :name
    
    def initialize(name)
      @name = name
    end
    
    # メソッド内でセッターメソッドを呼び出す時は、必ずselfを付ける
    def rename_to_bob
      name = "Bob"
    end
    
    def rename_to_carol
      self.name = "Carol"
    end

    def rename_to_dave
      @name = "Dave"
    end
  end
  user = User.new("Alice")

  user.rename_to_bob
  p user.name

  user.rename_to_carol
  p user.name

  user.rename_to_dave
  p user.name

# クラスメソッドやクラス構文直下のself
  # selfは場所によって、「そのクラスのインスタンス自身」や「クラス自身」を表す
  class Foo
    puts "クラス構文の直下のself: #{self}"

    def self.bar
      puts "クラスメソッド内のself: #{self}"
    end

    def baz
      puts "インスタンスメソッド内のself: #{self}"
    end
  end
  Foo.bar

  foo = Foo.new
  foo.baz

# クラスメソッドをインスタンスメソッドで呼び出す
  class Product
    attr_accessor :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    def self.format_price(price) # クラスメソッド self.class.format_priceと書いても、クラス名.メソッドと同じ
      puts "#{price}円"
    end

    def to_s # インスタンスメソッド
      formatted_price = Product.format_price(price)
      puts "name: #{name}, price: #{price}"
    end
  end
  product = Product.new("A great movie", 1000)
  product.to_s

  