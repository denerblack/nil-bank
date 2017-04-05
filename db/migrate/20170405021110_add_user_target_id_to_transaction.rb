class AddUserTargetIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_target_id, :integer
  end
end
