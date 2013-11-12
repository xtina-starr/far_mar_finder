class Vendor
  attr_accessor :vendor_id, :name, :number_of_employees, :market_id

  def initialize(array)
    @vendor_id = array[0]
    @name = array[1]
    @number_of_employees = array[2]
    @market_id = array[3]
  end

  def self.all
    CSV.read("./support/vendors.csv").map do |array|
      Vendor.new(array)
    end
  end

  def self.find(id)
    CSV.read("./support/vendors.csv").find do |array|
      array[0].to_i == id
    end
  end

   def self.find_by_market(market_id)
    CSV.read("./support/vendors.csv").find_all do |array|
      array[3].to_i == market_id.to_i
    end
  end
    
  def self.find_by_number_employees(employees)
    CSV.read("./support/vendors.csv").find do |array|
      array[2].to_i == employees
    end
  end

  def self.find_all_by_name(name)
    CSV.read("./support/vendors.csv").find_all do |array|
      array[1].downcase.include? name.downcase
    end
  end

  def market(market_id)
    CSV.read("./support/markets.csv").find_all do |array|
      array[0].to_i == market_id
    end
  end

end