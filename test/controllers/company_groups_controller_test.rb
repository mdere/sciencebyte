require 'test_helper'

class CompanyGroupsControllerTest < ActionController::TestCase
  setup do
    @company_group = company_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_group" do
    assert_difference('CompanyGroup.count') do
      post :create, company_group: { company_id: @company_group.company_id, group_id: @company_group.group_id }
    end

    assert_redirected_to company_group_path(assigns(:company_group))
  end

  test "should show company_group" do
    get :show, id: @company_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_group
    assert_response :success
  end

  test "should update company_group" do
    patch :update, id: @company_group, company_group: { company_id: @company_group.company_id, group_id: @company_group.group_id }
    assert_redirected_to company_group_path(assigns(:company_group))
  end

  test "should destroy company_group" do
    assert_difference('CompanyGroup.count', -1) do
      delete :destroy, id: @company_group
    end

    assert_redirected_to company_groups_path
  end
end
