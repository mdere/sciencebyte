class CreateCompanyRegisters < ActiveRecord::Migration
  def change
    create_table :company_registers do |t|
      t.string :business_name
      t.integer :address_number
      t.string :address_street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :contact_number
      t.string :account_handler_first
      t.string :account_handler_last
      t.string :password_hash
      t.datetime :member_since

      t.timestamps null: false
    end
  end
end
