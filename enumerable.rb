require_relative 'myenumerable'
class MyList
    include MyEnumerable
    def initialize(*list)
        @list = []
        list.each { |item| @list << item }
        @list
    end
    def each
        i = 0
        while i < @list.size
            yield @list[i]
            i += 1
        end
    end
end

list = MyList.new(1, 2, 3, 4)
list.all? {|e| e < 5}