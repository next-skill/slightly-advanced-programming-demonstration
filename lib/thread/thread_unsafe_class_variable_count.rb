class Counter
  @@count = 0

  def self.increment
    tmp = @@count + 1
    # 時間のかかる処理
    open($0) {}
    @@count = tmp
  end

  def self.count
    @@count
  end
end

threads = 2.times.map do |i|
  Thread.new do
    Counter.increment
  end
end

# 全てのスレッドの終了を待つ
threads.each(&:join)

puts Counter.count
