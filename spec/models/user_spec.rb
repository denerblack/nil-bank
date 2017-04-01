require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { should have_one(:balance) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:account) }
    it { should validate_presence_of(:password) }
  end

  describe "Create some customer" do
    let (:user) { create(:user) }

    it 'creates a balance' do
      expect(user.balance).to_not eq(nil)
    end

    it 'is a manager' do
      expect(user.manager?).to eq(false)
    end
  end
end
