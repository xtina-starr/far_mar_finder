class Market
  attr_accessor :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(array)
    @market_id = array[0]
    @name = array[1]
    @address = array[2]
    @city = array[3]
    @county = array[4]
    @state = array[5]
    @zip = array[6]
  end

  def self.all
  #maybe load in CSV data
  CSV.read("./support/markets.csv").map do |array|
    Market.new(array)
    end
  end

  def self.find(id)
    all.find do |array|
      array[0].to_i == id
    end
  end

  def self.find_by_name(name)
    CSV.read("./support/markets.csv").find do |array|
      array[1].downcase.include? name.downcase 
    end
  end

  def self.find_all_by_name(name)
    CSV.read("./support/markets.csv").find_all do |array|
      array[1].downcase.include? name.downcase 
    end
  end

    def self.find_all_by_state(state)
    CSV.read("./support/markets.csv").find_all do |array|
      array[-2].downcase.include? state.downcase 
    end
  end

  def vendors(market_id)
    CSV.read("./support/vendors.csv").find_all do |array|
      array[3].to_i == market_id
    end
  end

end