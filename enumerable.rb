class MyList
    def initialize(*list)
        @list = []
        list.each { |item| @list << item }
        @list
    end
end