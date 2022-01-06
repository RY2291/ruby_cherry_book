# クラスインスタンス変数
  # インスタンス変数　=> クラスをインスタンス化(クラス名.newでオブジェクトを作成)した際に、オブジェクトごとに管理される変数
  # クラスインスタンス変数 => クラス自身が保持しているデータ（クラス自身のインスタンス変数）
  class Product
    @name = "Product" # クラスインスタンス変数

    def self.name
      @name  # クラスインスタンス変数
    end

    def initialize(name)
      @name = name  #インスタンス変数
    end

    def name
      @name  #インスタンス変数
    end
  end
  p Product.name
  product = Product.new("A great movie")
  p product.name
  p Product.name

  p "========"
  class DVD < Product
    @name = "DVD"
    
    def self.name
      @name  # クラスインスタンス変数を参照
    end
    
    def upcase_name
      @name.upcase  #インスタンス変数を参照
    end
  end
  p Product.name
  p DVD.name
  
  product = Product.new("A great movie")
  p product.name
  
  dvd = DVD.new("An awesome film")
  p dvd.name
  p dvd.upcase_name
  
  p Product.name
  p DVD.name
  
p "========"
# クラス変数
  # クラスメソッド内、インスタンスメソッド内でも共有され、なおかつスーパークラスとサブクラスでも共有される変数。
  # 変数の前にを@@付ける

  class Product
    @@name = "Product"

    def self.name
      @@name
    end

    def initialize(name)
      @@name = name
    end

    def name
      @@name
    end
  end

  class DVD < Product
    @@name = DVD

    def self.name
      @@name
    end

    def upcase_name
      @@name.upcase
    end
  end

  p Product.name
  p DVD.name
  
  product = Product.new("A great movie")
  p product.name
  
  Product.name
  p DVD.name

  dvd = DVD.new("An awesome film")
  p dvd.name
  p dvd.upcase_name

  p product.name
  p Product.name
  p DVD.name
p "========"
# グローバル変数と組み込み変数
  # 変数名の前にを$付ける。クラス内部、外部問わず、プログラムのどこからでも変更、参照が可能。

  $program_name = "Awesome program"

  class Program
    def initialize(name)
      $program_name = name
    end

    def self.name
      $program_name
    end

    def name
      $program_name
    end
  end

  p Program.name

  program = Program.new("Super program")
  p program.name

  p Program.name
  p $program_name