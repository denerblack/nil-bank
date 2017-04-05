class AddLastOperationToBalance < ActiveRecord::Migration
  def change
    add_column :balances, :last_operation, :datetime
  end
end
