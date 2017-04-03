class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :kind
      t.float :amount
      t.references :balance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
