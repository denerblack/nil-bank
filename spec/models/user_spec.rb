# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  account                :string(255)
#  password               :string(255)
#  kind                   :integer
#  manager                :boolean          default("0")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

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
