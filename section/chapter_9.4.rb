# 例外処理の対象範囲と対象クラスを極力絞り込む
  require "date"

  def convert_heisei_to_date(heisei_text)
    begin
      m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
      year = m[:japan].to_i
      month = m[:month].to_i
      day = m[:day].to_i
      Date.new(year, month, day)
    rescue => exception
      nil
    end
  end
  # 上記に例だと範囲は広すぎるため、範囲を絞る
  def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:month].to_i
    day = m[:day].to_i
    begin
      Date.new(year, month, day)
    rescue ArgumentError
      nil
    end
  end

  p convert_heisei_to_date("平成28年12月31日")
  p convert_heisei_to_date("平成28年99月99日")



# 例外処理よりも条件分岐を使う
def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:japan].to_i
    month = m[:month].to_i
    day = m[:day].to_i
    if Date.valid_date?(year, month, day)
      Date.new(year, month, day)
    end
end