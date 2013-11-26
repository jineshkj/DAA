
$LOAD_PATH << File.dirname(__FILE__)

require 'benchmark'

require 'min_heap.rb'

gen = Random.new(1)

h = MinHeap.new

200000.times do 
  h.add(gen.rand(1000000))
end

report = Benchmark.measure do
  prev = nil
  while i = h.pop_min
    if prev and prev > i
      puts "Error in sorting..."
      break
    end
    prev = i
  end
end

puts report
