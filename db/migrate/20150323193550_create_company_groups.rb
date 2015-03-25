class CreateCompanyGroups < ActiveRecord::Migration
  def change
    create_table :company_groups do |t|
      t.integer :company_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
