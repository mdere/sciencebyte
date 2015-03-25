class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :hashed_password
      t.integer :user_type_id
      t.integer :science_points

      t.timestamps null: false
    end
  end
end
