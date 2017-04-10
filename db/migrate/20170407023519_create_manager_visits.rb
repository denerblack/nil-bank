class CreateManagerVisits < ActiveRecord::Migration
  def change
    create_table :manager_visits do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
