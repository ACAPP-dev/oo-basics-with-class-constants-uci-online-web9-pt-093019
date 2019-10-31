require 'benchmark'
class Shoe

  BRANDS = []
  attr_accessor :color, :size, :material, :condition
  attr_reader :brand

  def initialize(brand)
    @brand = brand
    #BRANDS << brand unless BRANDS.detect{|brand_array| brand_array == brand}
    BRANDS << brand unless BRANDS.include?(brand)

  end

  def cobble
    self.condition = "new"
    puts "Your shoe is as good as new!"
  end

end

Benchmark.bmbm do |x|
  x.report("detect") {10_000.times{(1..10000).to_a.detect{|number| number == 9999}}}
  x.report("find") {10_000.times{(1..10000).to_a.find{|number| number == 9999}}}
  x.report("include") {10_000.times{(1..10000).to_a.include?(9999)}}
end
