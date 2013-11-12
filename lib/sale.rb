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

  def self.find(id)
    CSV.read("./support/sales.csv").find do |array|
      array[0].to_i == id
    end
  end

  def self.find_by_amount_cents(amount)
    CSV.read("./support/sales.csv").find do |array|
      array[1].to_i == amount
    end
  end

  def self.find_all_by_product(id)
    CSV.read("./support/sales.csv").find_all do |array|
      array[4].to_i == product_id
    end
  end
end