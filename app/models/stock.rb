class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  
  def self.new_lookup(ticker_symbol)
    ticker_symbol.upcase!
    api_key = Rails.application.credentials.binance[:api_key]
    api_secret = Rails.application.credentials.binance[:secret_key]
    begin
      client = Binance::Client::REST.new api_key: api_key, secret_key: api_secret
      price = client.price(symbol: ticker_symbol)['price'].to_f
      new(ticker: ticker_symbol, name: ticker_symbol, last_price: price)
    rescue => exception
      return nil      
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end
