class Primes
  def self.sum_to(limit = 100)
    sum = 0
    for num in 2..limit           # iterate through each number up to the to set limit
      is_prime = true             # set is_prime as true by default
      puts "trying #{num}..."
      for divider in 2..num-1     # iterate through each number that it could divide by
        if num % divider == 0     # if there is no remainder then the number isn't prime
          is_prime = false        # so set is_prime boolean to false
          puts "not prime."
          break                   # and break out of the loop
        else
          next                    # otherwise, try the next possible dividing number
        end
      end
      if is_prime == true         # if is_prime is still true after trying every divider number then it's prime
        sum += num                # so add it to the total
        puts "is prime."
      end
    end
    puts "The sum of all prime numbers up to #{limit} is #{sum}"                  
  end
end

Primes.sum_to(10)

# The sum of all prime numbers up to 2000000 is 142913828922
# It took my PC over 3 hours to figure this out!