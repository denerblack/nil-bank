class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :account, length: 5
      t.string :password, length: 4
      t.string :kind
      t.boolean :manager, default: false

      t.timestamps null: false
    end
  end
end
