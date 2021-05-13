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
end
