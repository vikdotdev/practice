require "benchmark"

ractors = []
values = []

puts "Starting Ractor processing"

time_elapsed = Benchmark.measure do
  12.times do |i|
    ractors << Ractor.new(i) do |i|
      puts "In Ractor #{i}"
      5_000_000.times do |t|
        str = "#{t}"; str = str.upcase + str;
      end
      puts "Finished Ractor #{i}"
      "i: #{i}" # implicit return value, or use Ractor.yield
    end
  end

  values = ractors.map(&:take)
end

puts "End of processing, time elapsed: #{time_elapsed.real}"

# deterministic output. nice!
puts values.join(", ")



require "benchmark"

values = []

puts "Starting Not-Ractor processing"

time_elapsed = Benchmark.measure do
  12.times do |i|
    puts "In Not-Ractor #{i}"
    5_000_000.times do |t|
      str = "#{t}"; str = str.upcase + str;
    end
    puts "Finished Not-Ractor #{i}"
    values << "i: #{i}"
  end
end

puts "End of processing, time elapsed: #{time_elapsed.real}"

puts values.join(", ")
