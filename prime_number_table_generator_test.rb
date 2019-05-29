require 'minitest/autorun'
require './primes_generator.rb'

class PrimeNumberTableGeneratorTest < Minitest::Test
  def setup
    @n = 5
    @pntg = PrimeNumberTableGenerator.new(@n)
    @pntg.generate_n_primes
    @pntg.generate_table_for_n_primes
  end

  # Tests for generate_n_primes
  def test_generate_n_primes_test
    array_size = @pntg.primes_array.size
    assert_equal @n,array_size
  end

  # When n=1 is should just return 1
  def test_generate_1_prime
    pntg = PrimeNumberTableGenerator.new(1)
    pntg.generate_n_primes
    array_size = pntg.primes_array.size
    assert_equal 1,array_size
  end  
  
  # When n=0 is should just return 1
  def test_generate_0_prime
    pntg_exception = assert_raises ArgumentError do PrimeNumberTableGenerator.new(0) end
    assert_match /greater than 0/, pntg_exception.message      
  end

  # When n is not a number should just return 1
  def test_generate_str_prime
    pntg_exception = assert_raises ArgumentError do PrimeNumberTableGenerator.new("a") end
    assert_match /provide an Integer value/, pntg_exception.message      
  end
end
