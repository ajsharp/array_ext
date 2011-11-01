
class Array

  # Determine if two arrays have at least one intersecting member
  #
  # Takes an optional block argument which is used to specify how to compare
  # the array pairs.
  #
  # @example Default comparison -- checks simple equality
  #   [1, 2, 3].in?([3, 4, 5]) # => true
  #   [1, 2, 3].in?([4, 5, 6]) # => false
  #
  # @example Comparison with block argument
  #   ['one', 'two'].in?(['on']) { |a, b| a =~ /#{b}/ } # => true
  #   ['one', 'two'].in?(['z']) { |a, b| a =~ /#{b}/ }  # => false
  #
  # @param [Array] arr The array to match against
  # @param [Proc] block An optional condition
  # @return [Boolean]
  def in?(arr, &block)
    if block_given?
      self.detect do |i|
        arr.detect { |j| yield(i, j) }
      end
    else
      self.detect do |i|
        arr.detect { |j| i == j }
      end
    end
  end
end
