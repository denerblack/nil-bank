require 'rails_helper'

RSpec.describe BalanceManager do
  let(:user) do
  end

  describe "return extract" do
    it 'does extract' do
      user = create(:user)
      user.balance.add(2000)
      user_2 = create(:user, account: '1234')
      user_2.balance.add(150)
      transaction = build(:transaction, amount: 1001, kind: :withdraw, balance: user.balance)
      manager = TransactionManager.new(user)
      manager.do_transaction(transaction_2)
      extract = BalanceManager.extract(user)
      expect(extract.size).to eq(2)
    end
  end
end
