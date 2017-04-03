# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  kind       :string(255)
#  amount     :float(24)
#  balance_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
