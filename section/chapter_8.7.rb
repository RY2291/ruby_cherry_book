# モジュールに特異メソッドを定義する
  # モジュール単体でメソッドを呼び出したい場合は、モジュール自体に特異メソッドを定義して、
  # 直接、"モジュール名.メソッド名"にして呼び出す

  module Loggable
    def self.log(text)
      puts "[Log] #{text}"
    end
  end
  # モジュールはインスタンスを作れないため、newをする必要がない「単なるメソッドに集まり」を作成したいケースに向いている
  Loggable.log("Hello")
  

  p "-----------------------"
  # module_functionメソッド
    # ミックスインやモジュールの特異メソッドとしても使える
    module Loggable
      def log(text)
        puts "[Log] #{text}"
      end

      module_function :log
    end

    # モジュールの特異メソッドとしてlogメソッドを呼び出す
    Loggable.log("Hello")

    # Loggableモジュールをincludeしたクラスを呼び出す
    class Product
      include Loggable

      def title
        log "title is called.""A great movie"
      end
    end

    product = Product.new
    product.title

    # module_functionメソッドを引数なしで呼び出し場合は、そこから下に定義されたメソッドが全てモジュール関数になる
    module Loggable
      module_function
      # ここから下のメソッドは全てモジュール関数
      def log(text)
        puts "[Log] #{text}"
      end
    end

# モジュールに定数を定義する
    module Loggable
      PREFIX = "[log].freeze"
    end

    def log(text)
      puts "#{PREFIX} #{text}"
    end

    p Loggable::PREFIX

# モジュール関数や定数を持つモジュールの例
    # モジュール関数や定数を持つ、代表的な組み込みライブラリーはMathモジュール
    # Mathモジュールメソッドは、モジュール関数となっているため、モジュールの特異メソッドやミックスインとしても利用できる

    # モジュールの特異メソッドとしてメソッドを利用
    p Math.sqrt(2)

    # ミックスインとしてMathモジュールのsqrtメソッドを使う
    class Calculator
      include Math

      def calc_sqrt(n)
        puts sqrt(n)
      end
    end

    calculator = Calculator.new
    calculator.calc_sqrt(3)