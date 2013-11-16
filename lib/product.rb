class Product

  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id         = array[0].to_i
    @name       = array[1]
    @vendor_id  = array[2].to_i
  end

  def self.all
    @product_data ||= CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def self.find(product_id)
    all.find do |product|
      product.id.to_i == product_id.to_i
    end
  end

  def self.find(vendor_id)
    all.find do |product|
      product.id.to_i == vendor_id.to_i
    end
  end

  def self.by_vendor(vendor_id)
    all.find_all do |product|
      product.vendor_id.to_i == vendor_id.to_i
    end
  end

  def self.find_by_name(name)
    all.find do |product|
      product.name.downcase.include? name.downcase
    end
  end

  def self.find_all_by_name(name)
    all.find_all do |product|
      product.name.downcase.include? name.downcase
    end
  end

  def vendor
    Vendor.find(vendor_id)
  end

  def sales
    Sale.find_all_by_product_id(id)
  end

  def number_of_sales
    Sale.find_all_by_product_id(id).count
  end

end