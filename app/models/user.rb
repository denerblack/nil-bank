class User < ActiveRecord::Base
  has_one :balance
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [account: true, email: false]

  enum kind: %w(normal VIP)

  after_create :create_balance, unless: :manager?

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
