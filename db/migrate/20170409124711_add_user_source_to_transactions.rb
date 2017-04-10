class AddUserSourceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :user_source_id, :integer
  end
end
