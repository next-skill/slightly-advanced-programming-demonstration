class Counter
  def initialize
    @count = 0
  end

  def increment
    tmp = @count + 1
    # 時間のかかる処理
    open($0) {}
    @count = tmp
  end

  def count
    @count
  end
end

counter = Counter.new

threads = 2.times.map do |i|
  Thread.new do
    counter.increment
  end
end

# 全てのスレッドの終了を待つ
threads.each(&:join)

puts counter.count
