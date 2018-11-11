# file to test minitest

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other) # necessary method for `assert_equal` to work
    other.is_a?(Car) && name == other.name
  end
end