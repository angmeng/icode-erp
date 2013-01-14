require 'test_helper'

class InventoryHistoriesControllerTest < ActionController::TestCase
  setup do
    @inventory_history = inventory_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_history" do
    assert_difference('InventoryHistory.count') do
      post :create, inventory_history: { issue_id: @inventory_history.issue_id, product_id: @inventory_history.product_id, purchase_requisition_item_line_id: @inventory_history.purchase_requisition_item_line_id, stock_in: @inventory_history.stock_in, stock_out: @inventory_history.stock_out }
    end

    assert_redirected_to inventory_history_path(assigns(:inventory_history))
  end

  test "should show inventory_history" do
    get :show, id: @inventory_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_history
    assert_response :success
  end

  test "should update inventory_history" do
    put :update, id: @inventory_history, inventory_history: { issue_id: @inventory_history.issue_id, product_id: @inventory_history.product_id, purchase_requisition_item_line_id: @inventory_history.purchase_requisition_item_line_id, stock_in: @inventory_history.stock_in, stock_out: @inventory_history.stock_out }
    assert_redirected_to inventory_history_path(assigns(:inventory_history))
  end

  test "should destroy inventory_history" do
    assert_difference('InventoryHistory.count', -1) do
      delete :destroy, id: @inventory_history
    end

    assert_redirected_to inventory_histories_path
  end
end
