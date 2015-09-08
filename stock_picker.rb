# Implement a method 'stock_picker' that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days
# representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(days)
  biggest_profit = 0
  best_days = []
  days.each_index do |first_day|
    days.each_index do |second_day|
      if days[second_day] - days[first_day] > biggest_profit && second_day > first_day
        biggest_profit = days[second_day] - days[first_day]
        best_days = [first_day, second_day]
      end
    end
  end
  best_days
end


# tests

puts stock_picker([18, 15, 7, 2, 12, 13, 19, 26])

puts stock_picker([18, 67, 7, 43, 12, 13, 1, 1])
