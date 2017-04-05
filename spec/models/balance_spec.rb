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

  describe "subtract amount" do
    let(:normal_user) do
      user = create(:user, kind: :normal)
      create(:balance, user: user, last_operation: DateTime.current)
      user
    end

    let(:vip_user) {
      user = create(:user, kind: :VIP)
      create(:balance, user: user, last_operation: DateTime.current)
      user
    }

    it 'substracts' do
      expect { normal_user.balance.subtract(10.0) }.to change { normal_user.balance.amount }.by(-10.0)
    end

    it 'does not sustract because kind of user' do
      expect{ normal_user.balance.subtract(200) }.to raise_error('Você não tem saldo suficiente para esta transação')
    end

    it 'subtracts VIP' do
      expect { vip_user.balance.subtract(10.0) }.to change { vip_user.balance.amount }.by(-10.0)
    end
  end

  describe "add amount" do
    it 'adds' do
      user = create(:user, kind: :normal)
      expect { user.balance.add(100.0) }.to change { user.balance.amount }.by(100.0)
    end
  end

  describe "calculate rate" do
    let(:vip_user) do
      user = create(:user, kind: :VIP)
      create(:balance, user: user, amount: -150.0, last_operation: DateTime.current - 1.hour)
      user
    end

    it 'calculates' do
      expect(vip_user.balance.amount).to eq(-159)
    end
  end
end
