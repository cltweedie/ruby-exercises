# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

class Fib
	def self.gen_fib(limit = 100)
		sum = 0
		num1 = 1
		num2 = 2
		while num1 < limit && num2 < limit
			if num1.even?
				sum += num1
			end
			if num2.even?
				sum += num2
			end
			puts num1
			puts num2
			num1 = num1 + num2
			num2 = num2 + num1
		end
		puts "The sum of the even fibonacci numbers up to #{limit} is #{sum}."
	end
end

Fib.gen_fib(4000000)

# The sum of the even fibonacci numbers up to 4000000 is 4613732.
