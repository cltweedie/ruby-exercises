# Benchmark program

class Benchmarker
  def self.run(&block)
    start_time = Time.new
    yield
    end_time = Time.new
    return end_time - start_time
  end
end

x = Benchmarker.run do
  sum = 0
  (1..1000000).each do |num|
    (1..100).each do |num2|
      sum += num + num2
    end
  end
end

puts x
