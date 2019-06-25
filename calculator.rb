require 'minitest/autorun'

class CalculatorTest < MiniTest::Test
  def setup
    @calc = Calculator.new
  end
  def test_sum_two_numbers
    assert_equal 99, @calc.sum(1, 98)
  end
  def test_subtract_one_num
    assert_equal 37, @calc.difference(87, 50)
  end
  def test_multiply_two_numbers
    assert_equal 30, @calc.product(5, 6)
  end
  def test_divide_one_num_by_another
    assert_equal 4, @calc.quotient(20, 5)
  end
  def test_divide_by_zero
    assert_raises StandardError do
      @calc.quotient(3, 0)
    end
  end
  def test_remainder
    assert_equal 2, @calc.remainder(22,5)
  end
  def test_error_with_nil_value
    assert_raises StandardError do
      @calc.sum(nil,47)
    end
    assert_raises StandardError do
      @calc.difference(nil,3)
    end
    assert_raises StandardError do
      @calc.product(8,nil)
    end
    assert_raises StandardError do
      @calc.quotient(91, nil)
    end
    assert_raises StandardError do
      @calc.remainder(1, nil)
    end
  end
  def test_error_with_string
    assert_raises StandardError do
      @calc.sum("Weiner",3)
    end
    assert_raises StandardError do
      @calc.difference(1,"Butts")
    end
    assert_raises StandardError do
      @calc.product("Rusty Bullethole",9)
    end
    assert_raises StandardError do
      @calc.quotient(74,"Poop Chute")
    end
    assert_raises StandardError do
      @calc.remainder("Shit Snipper",1004)
    end
  end
end


class Calculator
  def sum(num1, num2)
    raise StandardError.new "Nil values not accepted." if (num1.nil? || num2.nil?)
    raise StandardError.new "Strings not accepted" if (num1.class == String || num2.class == String)
    total = num1 + num2
  end
  def difference(num1, num2)
    raise StandardError.new "Nil values not accepted." if (num1.nil? || num2.nil?)
    raise StandardError.new "Strings not accepted" if (num1.class == String || num2.class == String)
    total = num1 - num2
  end
  def product(num1, num2)
    raise StandardError.new "Nil values not accepted." if (num1.nil? || num2.nil?)
    raise StandardError.new "Strings not accepted" if (num1.class == String || num2.class == String)
    total = num1 * num2
  end
  def quotient(num1, num2)
    raise StandardError.new "Nil values not accepted." if (num1.nil? || num2.nil?)
    raise StandardError.new "Strings not accepted" if (num1.class == String || num2.class == String)
    raise StandardError.new "Cannot divide by zero." if (num2 === 0)
    total = num1/num2
  end
  def remainder(num1, num2)
    raise StandardError.new "Nil values not accepted." if (num1.nil? || num2.nil?)
    raise StandardError.new "Strings not accepted" if (num1.class == String || num2.class == String)
    total = num1%num2
  end
end
