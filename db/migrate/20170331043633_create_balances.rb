class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.references :user, index: true, foreign_key: true
      t.float :amount, default: 0.0

      t.timestamps null: false
    end
  end
end
