class Sale
  attr_accessor :sale_id, :amount_cents, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @sale_id = array[0]
    @amount_cents = array[1]
    @purchase_time = array[2]
    @vendor_id = array[3]
    @product_id = array[4]
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
    Sale.new(array)
    end
  end

  def self.find(sale_id)
    all.find do |sale|
      sale.sale_id.to_i == sale_id.to_i
    end
  end

  def self.find_by_amount_cents(amount)
    all.find do |sale|
      sale.amount_cents.to_i == amount.to_i
    end
  end

  def self.find_all_by_product(product_id)
    all.find_all do |sale|
      sale.product_id.to_i == product_id.to_i
    end
  end

  def self.find_by_vendor_id(vendor_id)
    all.find_all do |sale|
      sale.vendor_id.to_i == vendor_id.to_i
    end
  end

  def self.find_by_market_id(market_id)
    all.find_all do |sale|
      sale.market_id.to_i == market_id.to_i
    end
  end
  
end