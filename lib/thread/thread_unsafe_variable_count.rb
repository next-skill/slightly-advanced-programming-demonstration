count = 0

threads = 2.times.map do |i|
  Thread.new do
    tmp = count + 1

    # 時間のかかる処理
    open($0) {}

    count = tmp
  end
end

# 全てのスレッドの終了を待つ
threads.each(&:join)

puts count