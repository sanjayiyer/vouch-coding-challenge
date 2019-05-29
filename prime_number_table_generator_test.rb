require 'minitest/autorun'
require './primes_generator.rb'

class PrimeNumberTableGeneratorTest < Minitest::Test
  def setup
    @n = 10
    @pntg = PrimeNumberTableGenerator.new(@n)
    @pntg.generate_n_primes
    @pntg.generate_table_for_n_primes
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

  # Tests for generate_n_primes. Test if method generates only n no of primes
  def test_generate_n_primes_produces_right_size
    array_size = @pntg.primes_array.size
    assert_equal @n,array_size
  end

  # Test isPrime evaluates if a number is prime.
  # Caveat: Only checks against the primes generates beforehand. 
  # could model this better by generating n Primes less than number desired. 
  # Here we can get a positive test against the numbers that are less than the 10th prime number
  def test_isPrime_evaluates_primes_correctly
    assert @pntg.isPrime?(2)
    assert @pntg.isPrime?(1)
    assert_not @pntg.isPrime?(4)
    assert @pntg.isPrime?(3)    
  end  

  # Test generate_table_for_n_primes generates n*n table
  def test_isPrime_evaluates_primes_correctly
    assert_equal @n,@pntg.primes_table.size
    assert_equal @n,@pntg.primes_table[0].size
  end  
end
