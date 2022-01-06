# publicメソッド
  # クラス外部からでも自由に呼び出せるメソッド。initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになる
  class User
    def hello
      puts "hello"
    end
  end
  user = User.new
  # publicメソッドなのでクラスの外部から呼び出せる
  user.hello

# privateメソッド
  # レシーバーを指定して呼び出す事ができないメソッド。クラスの内部のみ使えるメソッド
  class User
    # ここから下で定義されたメソッドはprivate
    private
    def hello
      puts "hello"
    end
  end
  user = User.new
  # privateメソッドなのでクラス外部から呼び出しができない
  # user.hello

  # クラス内部においても、レシーバを指定できない。self付きで呼び出すとエラーになる。
  class User
    def hello
      puts "hello, I am #{self.name}"
    end

    private
    def name
      "Alice"
    end
  end
  user = User.new
  # user.hello

  # privateメソッドはサブクラスでも呼び出せる
  class Product
    private

    def name
      "A great movie"
    end
  end

  class DVD < Product
    def to_s
      puts "name: #{name}"
    end
  end
  dvd = DVD.new
  dvd.to_s

  p "========"
  # privateメソッドのオーバーライド
  class Product
    def to_s
      puts "name: #{name}"
    end
    
    private
    def name
      "A great movie"
    end
  end
  
  class DVD < Product
    private
    
    def name
      "An awesome film"
    end
  end
  product = Product.new
  product.to_s
  
  dvd = DVD.new
  # オーバーライドしたDVDクラスのnameメソッドが使われる
  dvd.to_s
  
  p "========"
  # クラスメソッドをprivateにした場合
    # privateメソッドになるのは、インスタンスメソッドだけ.
    class User
      private

      def self.hello
        puts "Hello"
      end
    end
    User.hello

    # クラスメソッドをprivateにしたい場合は、class << self構文を使用。
    class User
      class << self
        private

        def hello
          puts "Hello"
        end
      end
    end
    # User.hello

    # private_class_methodでクラスメソッドの定義後に公開レベルを変更出来る
    class User
      def hello
        puts "Hello"
      end
      private_class_method
    end
    # User.hello

    # 後からメソッドの公開レベルを変更する
      # privateに引数として既存のメソッド名を渡すと、privateメソッドになる。引数を渡した場合は、その下のメソッドはprivateにならない
      class User
        def foo
          p "foo"
        end

        def bar
          p "bar"
        end

        private :foo, :bar

        def baz
          p "baz"
        end
      end
      user = User.new
      # user.foo
      # user.bar
      user.baz

# protectedメソッド
  # メソッドを定義したクラス自身と、そのサブクラスのインスタンスメソッドからレシーバ付きで呼び出せる。
  class User
    attr_reader :name

    def initialize(name, weight)
      @name = name
      @weight = weight
    end

    def heavier_than?(other_user)
      p other_user.weight < @weight
    end

    protected
    def weight
      @weight
    end
  end
  alice = User.new("Alice", 50)
  bob = User.new("Bob", 60)
  # 同じクラスのインスタンスメソッド内ならweightが呼び出せる => protectedがあるため
  alice.heavier_than?(bob)
  bob.heavier_than?(alice)
  # クラス外ではweightを呼び出せない
  alice.weight
