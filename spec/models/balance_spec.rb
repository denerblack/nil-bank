# == Schema Information
#
# Table name: balances
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Balance, type: :model do
  describe "Associations" do
   it { should respond_to(:user)  }
  end
end
