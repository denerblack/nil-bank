class Balance < ActiveRecord::Base
  belongs_to :user

  def add(value, kind)
    self.amount += value
    #self.kind = kind
    save
  end
end
