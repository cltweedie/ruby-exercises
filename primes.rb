class Primes
  def self.sum_to(limit = 100)
    sum = 0
    for num in 2..limit                   # iterate through each number up to the to set limit
      is_prime = true                     # set is_prime as true by default
      puts "trying #{num}..."
      if num.even? && num != 2            # If the number is even (and not 2), don't bother testing it
        is_prime = false
        puts "not prime"
        next
      else
        for divider in 2..Math.sqrt(num)  # iterate through each number that it could divide by
          if num % divider == 0           # if there is no remainder then the number isn't prime
            is_prime = false
            puts "not prime"              # so set is_prime boolean to false
            break                         # and break out of the loop
          else
            next                          # otherwise, try the next possible dividing number
          end
        end
      end
      if is_prime == true                 # if is_prime is still true then it's prime
        sum += num                        # so add it to the total
        puts num.to_s + " is prime"                           
      end
    end
    puts "The sum of all prime numbers up to #{limit} is #{sum}"                  
  end
end

Primes.sum_to(2000000)

# This was MUCH faster (took a couple of minutes)
# The answer it gave was 142913828922 - same answer, but much more efficient algorithm.