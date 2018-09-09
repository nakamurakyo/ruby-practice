# ruby random_sample.rb

p rand(7).times.map{ rand(100) }
# => [31, 47, 79, 87, 91]


### 1~7
p rand(1..7).times.map{ rand(1..7) }
# => [3]