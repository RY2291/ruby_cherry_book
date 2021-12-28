# 2.8

  # 文字列は""や''だけでなく％でも作ることができる

    # %q!はシングルクオートで囲んだことと同じ
    puts %q!He said, "Dont't speak."!

    # %Q1はダブルクオートで囲んだことと同じ
    somethig = "Hello"
    puts %Q!He said, "#{somethig}"!
    
    # %! !もダブルクオートで囲んだことと同じ
    somethig = "Bye"
    puts %!He said, "#{somethig}"!



  # ヒアドキュメント
    #  複数行に渡る文字列を作成する時に使用
    def text_a
      <<~text
      これはヒアドキュメントです。
      複数行に渡る長い文字列を作成するのに便利です。
      text
    end
    puts text_a

    # <<識別子をメソッドの引数として渡したり、<<識別子に対してメソッドを呼び出すことができる
    a = "ruby"
    a.prepend(<<~TEXT)
    java
    php
    TEXT
    puts a

    b = <<~TEXT.upcase
    Hello,
    Good-bye
    TEXT
    puts b

  # フォーマットを指定して文字列を作成する
    # sprintfメソッドは指定されたフォーマットの文字列を作成することができる
    c = sprintf("%0.3f", 1.2)
    puts c

    # フォーマット文字列 % 表示したいオブジェクトでも上記と同じ結果
    d = "%0.3f" % 1.3
    puts d