class Vendor

  attr_accessor :id, :name, :no_of_employees, :market_id

  def initialize(array) # why do we need to pass through an array
    @id              = array[0].to_i
    @name            = array[1]
    @no_of_employees = array[2].to_i
    @market_id       = array[3].to_i
  end

  def self.all
    @vendor_data ||= CSV.read("./support/vendors.csv").map do |array|
      Vendor.new(array) 
    end
  end

  def self.find(vendor_id)
    all.find do |vendor|
      vendor.id == vendor_id
    end
  end

  def self.find_by_name(name)
    all.find do |vendor|
      vendor.name.downcase.include? name.downcase
    end
  end

  def self.find_all_by_name(name)
    all.find_all do |vendor|
      vendor.name.include? name.downcase
    end
  end

  def self.by_market(market_id)
    all.find_all do |vendor|
      vendor.market_id == market_id
    end
  end

  def market
    Market.find(market_id)
  end

  def products
    Product.by_vendor(@id)
  end

  def sales
    Sale.find_all_by_vendor_id(@id)
  end

  def revenue
    sum = 0
    vendor_sales = sales.map 
    vendor_sales.each do |sale|
      sum = sum + sale.amount_in_cents.to_i
    end
    sum
  end

  def revenue_in_dollars
    revenue / 100
  end
end

