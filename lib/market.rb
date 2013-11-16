class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(array) #why did we need to pass thru an array?
    @id         = array[0].to_i
    @name       = array[1]
    @address    = array[2]
    @city       = array[3]
    @county     = array[4]
    @state      = array[5]
    @zip        = array[6]
  end

  def self.all
    @market_data ||= CSV.read("./support/markets.csv").map do |array|
      # puts all the rows/(instances of the class) into arrays
      # puts array.inspect
      Market.new(array)
      # matches the values/(instances) to the variable name
    end
  end

  def self.find(market_id)
    all.find do |market|
      market.id.to_i == market_id.to_i
    end
  end

  def self.find_by_name(name)
    all.find do |market|
      market.name.downcase.include? name.downcase
    end
  end

  def self.find_all_by_name(name)
    all.find_all do |market|
      market.name.downcase.include? name.downcase
    end
  end

  def self.findy_by_state(state)
    all.find_all do |market|
      market.state.downcase.include? state
    end
  end

  def self.random
    all.sample
  end

  def vendor_name
    Vendor.find_by_name(name)
  end

  def self.search(search_term)
    all.find_all do |market|
      market.name.include? search_term || all.find_all do |market| 
        market.vendors.name.include? search_term
      end
    end
  end

  def vendors
    Vendor.by_market(id)
  end

  def products
    vendors_at_market = Vendor.by_market(id)
    vendors_at_market.map do |vendor_market|
      Product.by_vendor(vendor_market.id)
    end
  end
end