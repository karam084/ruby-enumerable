# Define MyEnumerable module
module MyEnumerable
  def all?
    return true unless block_given?

    result = true
    each { |item| result &= yield(item) }
    result
  end

  def any?
    return false unless block_given?

    result = false
    each { |item| result |= yield(item) }
    result
  end

  def filter
    return [] unless block_given?

    result = []
    each { |item| result << item if yield(item) }
    result
  end
end
