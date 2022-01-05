# クラスの継承
  # 「サブクラスはスーパークラスの一種である」と読んで違和感がないもの。サブクラスはスーパークラスの性質を特化したもの。

# デフォルトで継承されるObjectクラス
  # 独自に作成したクラスはデフォルトでObjectクラスを継承しているので、Objectクラスのメソッドが使用できる
  class User
  end
  user = User.new
  p user.to_s
  p user.nil?

# オブジェクトのクラスを確認する
  # 継承関係を含めて確認したい場合は、is_a?メソッドを使用する
  user = User.new
  p user.is_a?(User)
  p user.is_a?(Object)
  p user.is_a?(BasicObject)
  p user.is_a?(String)
  
# superでスーパークラスのメソッドを呼び出す
  # スーパークラスとサブクラスで実行する処理が変わらないなら、同名のメソッド(initializeメソッド)を
  # 定義したりsuperを呼ぶ必要がない。
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
product = Product.new("A great movie", 1000)
p product.name
p product.price

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price) #superクラスのinitializeメソッドを呼び出す
    @running_time = running_time
  end
end
dvd = DVD.new("A fun movie", 3000, 120)
p dvd.name
p dvd.price
p dvd.running_time

# メソッドのオーバーライド
  # サブクラスではスーパークラスと同名のメソッドを定義することで、スーパークラスの処理を上書きできる。
  class Product
    attr_reader :name, :price
  
    def initialize(name, price)
      @name = name
      @price = price
    end

    def to_s
      "name: #{name}, price: #{price}"
    end
  end
  
  class DVD < Product
    attr_reader :running_time
  
    def initialize(name, price, running_time)
      super(name, price) 
      @running_time = running_time
    end

    def to_s
      "#{super}, running_time: #{@running_time}"
    end
  end
  product = Product.new("A great movie", 1000)
  product.to_s

  dvd = DVD.new("An awesome filem", 4500, 200)
  p dvd.to_s
