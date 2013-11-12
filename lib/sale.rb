class Sale
  attr_accessor :sale_id, :amount_cents, :purchase_time, :vendor_id, :product_id

  def initialize(sale_id,amount_cents,purchase_time,vendor_id,product_id)
    @sale_id = sale_id
    @amount_cents = amount_cents
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    CSV.read("../support/sales.csv").map do |array|
    # puts array.inspect
    Sale.new(*array)
    end
  end

  def self.find(sale_id)
    CSV.read("../support/sales.csv").find do |array|
      array[0].to_i == sale_id
    end
  end

  def self.find_by_amount_cents(amount)
    CSV.read("../support/sales.csv").find do |array|
      array[1].to_i == amount
    end
  end

  def self.find_all_by_product(product_id)
    CSV.read("../support/sales.csv").find_all do |array|
      array[4].to_i == product_id
    end
  end
end