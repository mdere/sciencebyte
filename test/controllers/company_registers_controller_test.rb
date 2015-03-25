require 'test_helper'

class CompanyRegistersControllerTest < ActionController::TestCase
  setup do
    @company_register = company_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_register" do
    assert_difference('CompanyRegister.count') do
      post :create, company_register: { account_handler_first: @company_register.account_handler_first, account_handler_last: @company_register.account_handler_last, address_number: @company_register.address_number, address_street: @company_register.address_street, business_name: @company_register.business_name, city: @company_register.city, contact_number: @company_register.contact_number, member_since: @company_register.member_since, password_hash: @company_register.password_hash, state: @company_register.state, zip: @company_register.zip }
    end

    assert_redirected_to company_register_path(assigns(:company_register))
  end

  test "should show company_register" do
    get :show, id: @company_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_register
    assert_response :success
  end

  test "should update company_register" do
    patch :update, id: @company_register, company_register: { account_handler_first: @company_register.account_handler_first, account_handler_last: @company_register.account_handler_last, address_number: @company_register.address_number, address_street: @company_register.address_street, business_name: @company_register.business_name, city: @company_register.city, contact_number: @company_register.contact_number, member_since: @company_register.member_since, password_hash: @company_register.password_hash, state: @company_register.state, zip: @company_register.zip }
    assert_redirected_to company_register_path(assigns(:company_register))
  end

  test "should destroy company_register" do
    assert_difference('CompanyRegister.count', -1) do
      delete :destroy, id: @company_register
    end

    assert_redirected_to company_registers_path
  end
end
