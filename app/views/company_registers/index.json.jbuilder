json.array!(@company_registers) do |company_register|
  json.extract! company_register, :id, :business_name, :address_number, :address_street, :city, :state, :zip, :contact_number, :account_handler_first, :account_handler_last, :password_hash, :member_since
  json.url company_register_url(company_register, format: :json)
end
