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
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: ENV['IEX_PUBLISHABLE'],
      secret_token: ENV['IEX_SECRET_TOKEN'],
      endpoint: ENV['IEX_ENDPOINT']
    )
    client.price(ticker_symbol)
  end
end
