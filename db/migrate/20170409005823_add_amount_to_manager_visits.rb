class AddAmountToManagerVisits < ActiveRecord::Migration
  def change
    add_column :manager_visits, :amount, :float
  end
end
