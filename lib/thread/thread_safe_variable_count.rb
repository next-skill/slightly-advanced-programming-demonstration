count = 0

m = Mutex.new

threads = 2.times.map do |i|
  Thread.new do
    m.synchronize do
      tmp = count + 1

      # ファイルを開く (時間のかかる処理ならなんでも良い)
      open($0) do
        # Do nothing
      end
  
      count = tmp
    end
  end
end

# 全てのスレッドの終了を待つ
threads.each(&:join)

puts count