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

FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    account Faker::Number.number(5)
    password Faker::Number.number(4)
  end
end
