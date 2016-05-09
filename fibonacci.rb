def recursive_fib(n)
  return n if n == 0 || n == 1
  recursive_fib(n-1) + recursive_fib(n-2)
end


def iterative_fib(n)
  list = [0,1]
  return n if n == 0 || n ==1 
  (n-1).times do
    list << list[-1] + list[-2]
  end
  list[-1]
end

# puts recursive_fib(35) #9227465
# puts iterative_fib(35) #9227465


require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end

#                   user     system      total        real
# recursive_fib  2.280000   0.020000   2.300000 (  2.312824)
# iterative_fib  0.000000   0.000000   0.000000 (  0.000025)