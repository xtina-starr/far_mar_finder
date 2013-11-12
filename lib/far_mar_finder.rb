require 'csv'
require 'time'
# require "./lib/marker" this is the same thing as line 4
require_relative 'market'
require_relative 'sale'
require_relative 'product'
require_relative 'vendor'
# ... Require all of the supporting classes

class FarMarFinder
  def markets
    Market
  end

  def vendors
    Vendor
  end

  def products
    Product
  end

  def sales
    Sale
  end
end

