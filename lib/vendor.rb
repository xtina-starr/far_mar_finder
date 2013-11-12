class Vendor
  attr_accessor :vendor_id, :name, :number_of_employees, :market_id

  def initialize(vendor_id,name,number_of_employees,market_id)
    @vendor_id = vendor_id
    @name = name
    @number_of_employees = number_of_employees
    @market_id = market_id
  end

  def self.all
    CSV.read("../support/vendors.csv").map do |array|
      Vendor.new(*array)
    end
  end

  def self.find(vendor_id)
    CSV.read("../support/vendors.csv").find do |array|
      array[0].to_i == vendor_id
    end
  end
    

end