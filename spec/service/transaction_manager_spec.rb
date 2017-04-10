require 'rails_helper'

RSpec.describe TransactionManager do
  describe "Do all transactions" do
    let(:user) {
      user = create(:user)
      user.balance.add(2000)
      user
    }

    let(:user_2) {
      user_2 = create(:user, account: '1234')
      user_2.balance.add(150)
      user_2
    }

    it 'does withdraw transaction' do
      transaction = build(:transaction, amount: 100, kind: :deposit)
      expect{TransactionManager.new(user).do_transaction(transaction)}.to change{user.balance.amount}.by(100)
    end

    it 'does deposit transaction' do
      transaction = build(:transaction, amount: 25, kind: :withdraw)
      expect{TransactionManager.new(user).do_transaction(transaction)}.to change{user.balance.amount}.by(-25)
    end

    it 'does transfer transaction by normal user' do
      user.normal!
      transaction = build(:transaction, amount: 25, kind: :transfer)
      expect{TransactionManager.new(user).do_transaction(transaction, user_2.account)}.to change{user.balance.amount}.by(-33)
    end

    it 'does transfer transaction by VIP user' do
      user.VIP!
      transaction = build(:transaction, amount: 25, kind: :transfer)
      expect{TransactionManager.new(user).do_transaction(transaction, user_2.account)}.to change{user.balance.amount}.by(-25.200000000000045)
    end

    it 'doesnt transfer amount greather than 1000' do
      user.normal!
      transaction = build(:transaction, amount: 1001, kind: :transfer)
      expect{TransactionManager.new(user).do_transaction(transaction, user_2.account)}.to change{user.balance.amount}.by(0)
    end

    it 'doesnt transfer amount greather than 1000' do
      user.VIP!
      transaction = build(:transaction, amount: 1001, kind: :transfer)
      expect{TransactionManager.new(user).do_transaction(transaction, user_2.account)}.to change{user.balance.amount}.by(-1009.01)
    end
  end
end
