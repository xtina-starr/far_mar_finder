class Product
  attr_accessor :product_id, :name, :vendor_id

  def initialize(product_id,name,vendor_id)
    @product_id = product_id
    @name = name
    @vendor_id = vendor_id
  end

  def self.all
    CSV.read("../support/products.csv").map do |array|
      # puts array.inspect
      Product.new(*array)
      end
  end

  def self.find(product_id)
    CSV.read("../support/products.csv").find do |array|
      array[0].to_i == product_id
    end
  end

  def self.find_by_vendor_id(vendor_id)
    CSV.read("../support/products.csv").find do |array|
      array[2].to_i == vendor_id
    end
  end

end