# エイリアスメソッドの定義
  # 独自に作成したクラスでもエイリアスメソッドを定義する事が出来る。
  # alias 新しい名前　元の名前
  class User
    def hello
      "Hello"
    end

    alias greeting hello
  end
  user = User.new
  p user.hello
  p user.greeting

# メソッドの削除
  # undef 削除するメソッドの名前
  class User
    undef freeze
  end
  user = User.new
  # user.freeze

# ネストしたクラスの定義
  # クラスを定義する場合、クラスの内部に別のクラスを定義する事が出来る
  # クラスの内部に定義したクラスは ::を使用して参照出来る
  # 外側のクラス::内側のクラス

  class User
    class BloodType
      attr_reader :type

      def initialize(type)
        @type = type
      end
    end
  end

  blood_type = User::BloodType.new("B")
  p blood_type.type

# 等値を判断するメソッドや演算子を理解する
  # equal?
    # object_idが等しい場合にtureを返す。全く同じインスタンスかどうかを判断する場合に使用する。再定義はｘ
    a = "abc"
    b = "abc"
    p a.equal?(b)

    c = a
    p a.equal?(c)

  # ==
    # オブジェクトの内容が等しいかどうかを判断する。データ型が間違っていても、人間の目で見て自然であればtrueを返すように再定義をする。
    p 1 == 1.0

  # eql?
    # ハッシュのキーとして２つのオブジェクトが等しいかどうかを判断する。ハッシュ上では、１と1.0は別々のキーとして扱われる。
    h = { 1 => "Integer", 1.0 => "float" }
    p h[1]
    p h[1.0]
    p 1.eql?(1.0)

# オープンクラス
  # Rubyでは、クラスの継承に制限がない。
  class Mystring < String
  end
  s = Mystring.new("Hello")
  p s

  class MyArray < Array
  end
  a = MyArray.new()
  a << 1
  a << 2
  p a

# モンキーパッチ
  # 既存の実装を上書きして、自分が期待する挙動に変更すること。
  class User
    def initialize(name)
      @name = name
    end

    def hello
      "Hello, #{@name}"
    end
  end

  user = User.new("Alice")
  p user.hello

  # helloメソッドにモンキーパッチをあてる
  class User
    def hello
      "#{@name}さん、こんにちは"
    end
  end
  p user.hello

# 特異メソッド
  # 特定のオブジェクトにだけ紐づくメソッド。数値やシンボルには特異メソッドを定義できない。
  # Rubyではクラス単位ではなく、オブジェクト単位で挙動を変える事が出来る。
  alice = "I am Alice"
  bob = "I am Bob"

  def alice.shuffle
    chars.shuffle.join
  end
  p alice.shuffle
  p bob.shuffle