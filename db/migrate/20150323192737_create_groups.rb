class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :group_type_id
      t.integer :total_users
      t.integer :total_companies

      t.timestamps null: false
    end
  end
end
