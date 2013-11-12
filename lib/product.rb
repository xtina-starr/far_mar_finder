class Product
  attr_accessor :product_id, :name, :vendor_id

  def initialize(array)
    @product_id = array[0]
    @name = array[1]
    @vendor_id = array[2]
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      # puts array.inspect
      Product.new(array)
      end
  end

  def self.find(product_id)
    CSV.read("./support/products.csv").find do |array|
      array[0].to_i == product_id
    end
  end

  def self.find_by_vendor_id(vendor_id)
    CSV.read("./support/products.csv").find do |array|
      array[2].to_i == vendor_id
    end
  end

    def self.find_all_by_name(name)
    CSV.read("./support/products.csv").find_all do |array|
      array[1].downcase.include? name.downcase
    end
  end

end