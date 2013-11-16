class Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id              = array[0].to_i
    @amount          = array[1].to_i
    @purchase_time   = Time.parse(array[2])
    @vendor_id       = array[3].to_i
    @product_id      = array[4].to_i
  end

  def self.all
    @sale_data ||= CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end
  
  def self.find(sale_id)
    all.find do |sale|
      sale.id.to_i == sale_id.to_i
    end
  end

  def self.find_by_amount(amount_cent)
    all.find do |sale|
      sale.amount == amount_cent.to_i
    end
  end

  def self.find_all_by_product_id(product_id)
    all.find_all do |sale|
      sale.product_id.to_i == product_id.to_i
    end
  end

  def self.find_all_by_vendor_id(vendor_id)
    all.find_all do |sale|
      sale.vendor_id.to_i == vendor_id.to_i
    end
  end

  def self.between(beginning_time, ending_time)
    all.find_all do |sale|
      sale.purchase_time.between? Time.new(beginning_time), Time.new(ending_time)
    end
  end

  def vendor
    Vendor.find(vendor_id)
  end

  def product
    Product.find(product_id)
  end

end