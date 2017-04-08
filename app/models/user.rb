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

class User < ActiveRecord::Base
  has_one :balance
  has_many :transactions, foreign_key: 'user_target_id'
  has_many :investment_portfolios
  has_many :manager_visits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:account]

  validates_presence_of :name
  validates_presence_of :account
  validates_presence_of :password


  enum kind: [:normal, :VIP]

  after_create :create_balance

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def manager?
    manager
  end

end
