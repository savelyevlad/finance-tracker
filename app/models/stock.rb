class Stock < ApplicationRecord
  
  def self.new_lookup(ticker_symbol)
    client = Binance::Client::REST.new
    client.price(symbol: ticker_symbol)['price'].to_f
  end

end
