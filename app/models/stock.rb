# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  ticker     :string(255)
#  name       :string(255)
#  last_price :decimal(10, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :ticker, :name, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_PUBLISHABLE'],
                                  secret_token: ENV['IEX_SECRET_TOKEN'],
                                  endpoint: ENV['IEX_ENDPOINT'])
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol)&.company_name, last_price: client.price(ticker_symbol))
    rescue
      nil
    end
  end
end
