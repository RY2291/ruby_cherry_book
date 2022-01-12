# 名前空間を分けて名前の衝突を防ぐ
  # 同じ名前のクラスがある場合、クラスを区別できないため、モジュール構文の中にクラス定義を書くと
  # そのモジュールに属するクラスの意味になるため、同名のクラスがあっても衝突はしなくなる。
  module Baseball
    class Second
      def initialize(player, uniform_number)
        @player = player
        @uniform_number = uniform_number
      end
    end
  end
  
  module Clock
    class Second
      def initialize(digits)
        @digits = digits
      end
    end
  end

  # モジュールに属するクラスを参照する際は、”モジュール名::クラス名”のようにする
  Baseball::Second.new("Alice")
  Clock::Second.new(13)

# ネストなしで名前空間付のクラスを定義する
  # 名前空間として使うモジュールが既にどこかで定義されている場合は、"モジュール名::クラス名"でクラスを定義できる
  module Baseball
  end

  class Baseball::Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end