class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(id,name,address,city,county,state,zip)
    @id = id
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

end