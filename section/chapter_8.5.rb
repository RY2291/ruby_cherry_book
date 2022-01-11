# incudeされたモジュールの有無を確認する
  module Loggable
  end

  class Product
    include Loggable
  end

  # あるクラスに特定のモジュールがincludeされているかどうか確認する
  p Product.include?(Loggable)

  # included_modulesメソッドを呼ぶと、includeされているモジュールの配列が返る
  p Product.included_modules

  # ancestorsメソッドは、モジュールだけでなくスーパークラスの情報も配列になって返る。
  p Product.ancestors

# include先のメソッドを使うモジュール
module Taggable
  # priceメソッドはinclude先で定義されているはず、という前提
  def price_tag
    "#{price}"
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
p product.price_tag

# Enumerableモジュール
  # 配列やハッシュ、範囲などの何かしらの繰り返し処理が出来るクラスにincludeされているモジュール。
  p Array.include?(Enumerable)
  p Hash.include?(Enumerable)
  p Range.include?(Enumerable)

  # Enumerableモジュールには、map, select, find, countなどのメソッドが定義されている。
    # 配列やハッシュ、範囲でmapメソッドを使用する
    p [1, 2, 3].map { |n| n * 10 }
    { a: 1, b: 2, c: 3 }.map { |k, v| [k, v * 10] }
    p (1..3).map { |n| n * 10 }

# Comparableモジュールと<=>演算子
  # 比較演算を可能にする（値の大小を識別出来るようにする）モジュール。Comparableモジュールをincludeすると以下のメソッドが使えるようになる
  # < <= == > >= between?
  # Comparableモジュールのメソッドを使用にするには、include先のクラスで<=>演算子を実装しておくこと。
  p 2 <=> 1 
  p 2 <=> 2
  p 1 <=> 2
  p 2 <=> "aaa"

  p "======"
  class Tempo
    include Comparable

    attr_reader :bpm

    def initialize(bpm)
      @bpm = bpm
    end

    def <=>(other)
      if other.is_a?(Tempo)
        bpm <=> other.bpm
      else
        nil
      end
    end

    def inspect
      "#{@bpm}bpm"
    end
  end
  t120 = Tempo.new(120)
  p t120
  t180 = Tempo.new(180)

  p t120 > t180
  p t120 <= t180
  p t120 == t180

  tempos = [Tempo.new(180), Tempo.new(120), Tempo.new(60)]
  p tempos.sort

# Kernalモジュール
  # ObjectクラスがKernelクラスをincludeしている
  p Object.include?(Kernel)

# トップレベルはmainという名前のObject
  # クラス構文やモジュール構文に囲まれていない一番外側の部分をトップレベルと言う
    p self
    p self.class

# クラスやモジュール自身もオブジェクト
  # Rubyでは全てがオブジェクト
  class User
  end

  p User.class
  p Class.superclass

  module Loggable
  end

  p Loggable.class
  p Module.superclass

# モジュールとインスタンス変数
  # モジュール内で定義したメソッドの中でインスタンス変数を読み書きすると、include先のクラスの変数を読み書きしたことと同じなる。
  module NameChanger
    def change_name
      self.name = "アリス"
    end
  end

  class User
    include NameChanger

    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

  user = User.new("alice")
  p user.name
  p user.change_name
  p user.name

  # モジュールとインスタンス変数
  # モジュール内で定義したメソッドの中でインスタンス変数を読み書きすると、include先のクラスの変数を読み書きしたことと同じなる。
  module NameChanger
    def change_name
      self.name = "アリス"
    end
  end

  class User
    include NameChanger

    attr_accessor :name

    def initialize(name)
      @name = name
    end
  end

  user = User.new("alice")
  p user.name
  p user.change_name
  p user.name