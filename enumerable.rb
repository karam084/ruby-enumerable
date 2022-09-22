require_relative 'myenumerable'

# Define the MyList class
class MyList
  include MyEnumerable

  def initialize(*param)
    @list = []
    param.each { |item| @list << item }
  end

  def each
    i = 0
    while i < @list.size
      yield @list[i]
      i += 1
    end
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)
# puts list.each { |n| puts n }

# Test #all?
puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })

# Test #any?
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })

# Test #filter
puts(list.filter(&:odd?))
