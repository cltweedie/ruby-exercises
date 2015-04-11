# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

class Multiples
  def self.multiples_to(limit = 1000)
    sum = 0
    for num in 3...limit
      puts "Trying #{num}..."
      if num % 3 == 0 || num % 5 == 0
        puts "#{num} is a multiple of 3 or 5"
        sum += num
      else
        puts "#{num} is not a multiple of 3 or 5."
        next
      end
    end
    puts "The sum of multiples of 3 and 5 below #{limit} is #{sum}."
  end
end

Multiples.multiples_to

# The sum of multiples of 3 and 5 below 1000 is 233168.
