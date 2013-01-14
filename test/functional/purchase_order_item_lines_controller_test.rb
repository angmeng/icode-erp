require 'test_helper'

class PurchaseOrderItemLinesControllerTest < ActionController::TestCase
  setup do
    @purchase_order_item_line = purchase_order_item_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_item_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_item_line" do
    assert_difference('PurchaseOrderItemLine.count') do
      post :create, purchase_order_item_line: { purchase_requisition_item_id: @purchase_order_item_line.purchase_requisition_item_id }
    end

    assert_redirected_to purchase_order_item_line_path(assigns(:purchase_order_item_line))
  end

  test "should show purchase_order_item_line" do
    get :show, id: @purchase_order_item_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_item_line
    assert_response :success
  end

  test "should update purchase_order_item_line" do
    put :update, id: @purchase_order_item_line, purchase_order_item_line: { purchase_requisition_item_id: @purchase_order_item_line.purchase_requisition_item_id }
    assert_redirected_to purchase_order_item_line_path(assigns(:purchase_order_item_line))
  end

  test "should destroy purchase_order_item_line" do
    assert_difference('PurchaseOrderItemLine.count', -1) do
      delete :destroy, id: @purchase_order_item_line
    end

    assert_redirected_to purchase_order_item_lines_path
  end
end
