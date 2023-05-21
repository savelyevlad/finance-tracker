class Stock < ApplicationRecord
  
  def self.new_lookup(ticker_symbol)
    ticker_symbol.upcase!
    api_key = Rails.application.credentials.binance[:api_key]
    api_secret = Rails.application.credentials.binance[:secret_key]
    client = Binance::Client::REST.new api_key: api_key, secret_key: api_secret
    client.price(symbol: ticker_symbol)['price'].to_f
  end

end
