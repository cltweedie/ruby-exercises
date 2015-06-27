# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

class Collatz
  def self.calculate(limit = 1000000)
    @longest_chain = 0
    @starting_number = 0
    @chain = []
    # iterate through each number up to limit
    (1..limit).each do |number|
      # initialize the term as the starting number
      term = number
      while term != 1
        # push the term into the temporary chain array
        @chain.push(term)
        if term.even?
          term = term / 2
        else
          term = (3 * term) + 1
        end
      end
      puts "number: #{number}"
      puts "count: #{@chain.length}"
      if @chain.length > @longest_chain
        puts "Longest so far. Chain: #{@chain}"
        @longest_chain = @chain.length
        @starting_number = number
      end
      @chain = []
    end
    puts "starting number: #{@starting_number}"
    puts "longest chain: #{@longest_chain}"
  end
end

Collatz.calculate