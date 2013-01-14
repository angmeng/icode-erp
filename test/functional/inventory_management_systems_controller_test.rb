require 'test_helper'

class InventoryManagementSystemsControllerTest < ActionController::TestCase
  setup do
    @inventory_management_system = inventory_management_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_management_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_management_system" do
    assert_difference('InventoryManagementSystem.count') do
      post :create, inventory_management_system: { description: @inventory_management_system.description, name: @inventory_management_system.name }
    end

    assert_redirected_to inventory_management_system_path(assigns(:inventory_management_system))
  end

  test "should show inventory_management_system" do
    get :show, id: @inventory_management_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_management_system
    assert_response :success
  end

  test "should update inventory_management_system" do
    put :update, id: @inventory_management_system, inventory_management_system: { description: @inventory_management_system.description, name: @inventory_management_system.name }
    assert_redirected_to inventory_management_system_path(assigns(:inventory_management_system))
  end

  test "should destroy inventory_management_system" do
    assert_difference('InventoryManagementSystem.count', -1) do
      delete :destroy, id: @inventory_management_system
    end

    assert_redirected_to inventory_management_systems_path
  end
end
