# 状態を保持するモジュールの作成
  # クラスインスタンス変数を使用して、クラスにデータを保持させるのと同様に、モジュールでもできる。
  module AwesomeApi
    @base_url = ""
    @debug_mode = false

    class << self #特異クラス
      def base_url=(value)
        @base_url = value
      end

      def base_url
        @base_url
      end

      def debug_mode=(value)
        @debug_mode = value
      end

      def debug_mode
        @debug_mode
      end
    end
  end

  # 設定値を保存
  AwesomeApi.base_url = "http://example.com"
  AwesomeApi.debug_mode = true

  # 設定値を参照
  p AwesomeApi.base_url
  p AwesomeApi.debug_mode