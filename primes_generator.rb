class PrimeNumberTableGenerator
	# number_of_primes - stores number of primes numbers we intend to create
	# primes_array - generated prime numbers are stored here
	# primes_table - using the primes_array the primes table is generated and stored here
	attr_accessor :number_of_primes, :primes_array, :primes_table

	# initializes instance variables for the object
	def initialize(n)
		@number_of_primes = n
		@primes_array = Array.new		
		@primes_table = Array.new
	end

	# Generates number_of_primes-1 number of prime numbers and stores
	def generate_n_primes
		# Only assumption. 1 is the first prime number and used to generate further primes
		@primes_array.push(1)
		i = 1
		# loops until inteded number of primes are generated and stores
		while @primes_array.size != @number_of_primes
			i += 1
			@primes_array.push(i) if isPrime?(i)
		end
	end

	# checks if a number is prime
	# Number is considered prime when it is divisible by itself and 1 BUT no other number.
	# Here we just try and see if it is divisible by other primes.
	# this could be a real bottleneck if the number of primes we intend  to generate is large.
	def isPrime?(number)
		@primes_array.each_with_index do |prev_primes,index|
			# ignore first prime , i.e., 1
			next if index == 0
			# divisible by any other prime return false
			return false if number%prev_primes == 0
		end
		# not divisible by any other primes generated before.
		true
	end

	# Generates the table
	# every nth row is n-primes-array * nth primes
	def generate_table_for_n_primes
		i = 0
		for i in 0...@number_of_primes
			@primes_table[i] = @primes_array.collect{|prime| prime*@primes_array[i]}
		end
	end

	# pretty prints the table that makes it readable and aligns it well.
	def print_primes_table
		@primes_table.each do |row| 
			row.each do |number| 
				print  (number.to_s).rjust(5)+" "; 
			end 
			puts 
		end
	end
end

n = 10
## To run it from command line - uncomment 
## Ensure input is a valid number
#loop do
#	puts "Enter the number of Prime numbers to generate (Not a string OR a character and a number greater than 0):"
#	n = STDIN.gets.chomp.to_i
#	break if n > 0
#end
# 
prime_number_gen_obj = PrimeNumberTableGenerator.new(n)
prime_number_gen_obj.generate_n_primes
# puts
# puts "Number of Prime numbers to generate : #{prime_number_gen_obj.number_of_primes}"
# puts
# print "Here are first #{prime_number_gen_obj.number_of_primes} Prime Numbers :"
# print prime_number_gen_obj.primes_array
puts
puts "Generating the Primes Table:"
prime_number_gen_obj.generate_table_for_n_primes
prime_number_gen_obj.print_primes_table