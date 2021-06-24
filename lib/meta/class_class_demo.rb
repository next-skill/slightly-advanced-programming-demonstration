class User
  attr_reader :id, :name
  def initialize(id, name)
    @id = id
    @name = name
  end
end

user = User.new(1, 'Alice')
puts user.id
puts user.name

def create_instance(klass, arg1, arg2)
  klass.new(arg1, arg2)
end

user_class = user.class
user2 = create_instance(user_class, 2, 'Bob')

additional_methods = ['hoge', 'fuga', 'piyo']

additional_methods.each do |m|
  user2.define_singleton_method m do
    puts m
  end
end

puts user2.id
puts user2.name
user2.hoge
user2.fuga
user2.piyo
