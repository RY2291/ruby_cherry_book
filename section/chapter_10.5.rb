# Procオブジェクトを実行する様々な方法
  add_proc = Proc.new { |a, b| a + b }

  # callメソッド
  p add_proc.call(10, 20)

  # yeildメソッド
  p add_proc.yield(1, 2)

  # .()を使う
  p add_proc.(3, 4)

  # []を使う
  p add_proc[5, 6]

  # ===を使う
  def judge(age)
    adult = Proc.new { |n| n > 20 }
    child = Proc.new { |n| n < 20 }

    case age
    when adult
      puts "大人です"
    when child
      puts "子供です"
    else
      puts "二十歳です"
    end
  end

  judge(33)


# to_procメソッド
  # to_procメソッドを呼び出し、その戻り値として得られたProcオブジェクトを、ブロックを利用するメソッドに与える
  reverse_proc = Proc.new { |s| s.reverse }
  other_proc = reverse_proc.to_proc
  p reverse_proc.equal?(other_proc)

  # シンボルもproc_toメソッドを持つ
    # Procオブジェクトと異なるのは、実行時の引数の数によって実行される処理の内容が微妙に変わる。

    split_proc = :split.to_proc
    p split_proc

    # Procオブジェクトに引数を１つ渡して、実行すると、１つ目の引数をレシーバにし、そのレシーバに対して元のシンボルと同じ名前のメソッドを呼び出す
    p split_proc.call("a-b-c-d e")

    # 引数を２つ渡すと、１つ目の引数はレシーバ、２つ目の引数がシンボルで指定したメソッドの第１引数になる。
    p split_proc.call("a-b-c-d e", "-")   # "a-b-c-d e".split("-")と同じ

    # 引数を3つ渡すと、１つ目の引数はレシーバ、3つ目の引数がシンボルで指定したメソッドの第2引数になる。
    p split_proc.call("a-b-c-d e", "-", 3)  # "a-b-c-d e".split("-", 3)と同じ


# Procオブジェクトとクロージャ
  # Procオブジェクト内で引数やローカル変数を参照すると、メソッドの実行が完了してもProcオブジェクトが引数やローカル変数にアクセスし続けられる。

  def generate_proc(array)
    counter = 0

    Proc.new do
      counter += 10
      array << counter
    end
  end

  values = []
  sample_proc = generate_proc(values)
  p values

  sample_proc.call
  p values
  
  sample_proc.call
  p values