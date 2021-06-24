class ActiveRecordImitation
  def self.inherited(klass)
    puts "inherited. klass = #{klass}"

    def klass.find(id)
      puts "find called. id = #{id}"

      table = "#{self.name.downcase}s"
      puts "table = #{table}"

      sql = "select * from #{table} where id = #{id}"
      puts "sql = #{sql}"

      data = query(sql)

      return nil if data.nil?

      instance = self.new
      data.each do |key, value|
        puts "defining... key = #{key}, value = #{value}"
        instance.define_singleton_method key do
          value
        end
      end
      instance
    end
  end
end

# DB に接続する代わりに、このメソッドを呼び出す
# 本来なら、このメソッドの内部で、DB に接続して select を実行して、結果を返す
def query(sql)
  if sql == "select * from users where id = 1"
    {
      id: 1,
      name: 'Alice',
    }
  else
    nil
  end
end
