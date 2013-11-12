class Market
  attr_accessor :market_id, :name, :address, :city, :county, :state, :zip

  def initialize(market_id,name,address,city,county,state,zip)
    @market_id = market_id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
  #maybe load in CSV data
  CSV.read("../support/markets.csv").each do |array|
    Market.new(*array)
    end
  end

  def self.find(market_id)
    CSV.read("../support/markets.csv").find do |array|
      array[0].to_i == market_id
    end
  end

  def self.find_by_name(name)
    CSV.read("../support/markets.csv").find do |array|
      array[1].downcase.include? name.downcase 
    end
  end

  def self.find_all_by_name(name)
    CSV.read("../support/markets.csv").find_all do |array|
      array[1].downcase.include? name.downcase 
    end
  end

    def self.find_all_by_state(state)
    CSV.read("../support/markets.csv").find_all do |array|
      array[-2].downcase.include? state.downcase 
    end
  end


end