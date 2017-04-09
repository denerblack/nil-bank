# == Schema Information
#
# Table name: investment_portfolios
#
#  id             :integer          not null, primary key
#  action         :string(255)
#  status         :integer
#  purchase_price :float(24)
#  sale_price     :float(24)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  quantity       :integer
#  sale_quantity  :integer
#

require 'rails_helper'

RSpec.describe InvestmentPortfolio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
