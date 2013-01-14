require 'test_helper'

class SalesOrderItemsControllerTest < ActionController::TestCase
  setup do
    @sales_order_item = sales_order_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_order_item" do
    assert_difference('SalesOrderItem.count') do
      post :create, sales_order_item: { complete_qty: @sales_order_item.complete_qty, current_stock: @sales_order_item.current_stock, customer_po: @sales_order_item.customer_po, description: @sales_order_item.description, eta: @sales_order_item.eta, part_no: @sales_order_item.part_no, product_id: @sales_order_item.product_id, quantity: @sales_order_item.quantity, sales_order_id: @sales_order_item.sales_order_id, status: @sales_order_item.status, unit_measurement_id: @sales_order_item.unit_measurement_id, unit_price: @sales_order_item.unit_price }
    end

    assert_redirected_to sales_order_item_path(assigns(:sales_order_item))
  end

  test "should show sales_order_item" do
    get :show, id: @sales_order_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_order_item
    assert_response :success
  end

  test "should update sales_order_item" do
    put :update, id: @sales_order_item, sales_order_item: { complete_qty: @sales_order_item.complete_qty, current_stock: @sales_order_item.current_stock, customer_po: @sales_order_item.customer_po, description: @sales_order_item.description, eta: @sales_order_item.eta, part_no: @sales_order_item.part_no, product_id: @sales_order_item.product_id, quantity: @sales_order_item.quantity, sales_order_id: @sales_order_item.sales_order_id, status: @sales_order_item.status, unit_measurement_id: @sales_order_item.unit_measurement_id, unit_price: @sales_order_item.unit_price }
    assert_redirected_to sales_order_item_path(assigns(:sales_order_item))
  end

  test "should destroy sales_order_item" do
    assert_difference('SalesOrderItem.count', -1) do
      delete :destroy, id: @sales_order_item
    end

    assert_redirected_to sales_order_items_path
  end
end
