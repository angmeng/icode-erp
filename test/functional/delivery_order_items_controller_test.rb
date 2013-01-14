require 'test_helper'

class DeliveryOrderItemsControllerTest < ActionController::TestCase
  setup do
    @delivery_order_item = delivery_order_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_order_item" do
    assert_difference('DeliveryOrderItem.count') do
      post :create, delivery_order_item: { balance_qty: @delivery_order_item.balance_qty, client_lot: @delivery_order_item.client_lot, client_po: @delivery_order_item.client_po, delivery_qty: @delivery_order_item.delivery_qty, department: @delivery_order_item.department, dept_current_stock: @delivery_order_item.dept_current_stock, do_status: @delivery_order_item.do_status, gen_current_stock: @delivery_order_item.gen_current_stock, no_of_carton: @delivery_order_item.no_of_carton, order_qty: @delivery_order_item.order_qty, part_no: @delivery_order_item.part_no, sales_order_item_id: @delivery_order_item.sales_order_item_id, so_date: @delivery_order_item.so_date, unit_price: @delivery_order_item.unit_price }
    end

    assert_redirected_to delivery_order_item_path(assigns(:delivery_order_item))
  end

  test "should show delivery_order_item" do
    get :show, id: @delivery_order_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_order_item
    assert_response :success
  end

  test "should update delivery_order_item" do
    put :update, id: @delivery_order_item, delivery_order_item: { balance_qty: @delivery_order_item.balance_qty, client_lot: @delivery_order_item.client_lot, client_po: @delivery_order_item.client_po, delivery_qty: @delivery_order_item.delivery_qty, department: @delivery_order_item.department, dept_current_stock: @delivery_order_item.dept_current_stock, do_status: @delivery_order_item.do_status, gen_current_stock: @delivery_order_item.gen_current_stock, no_of_carton: @delivery_order_item.no_of_carton, order_qty: @delivery_order_item.order_qty, part_no: @delivery_order_item.part_no, sales_order_item_id: @delivery_order_item.sales_order_item_id, so_date: @delivery_order_item.so_date, unit_price: @delivery_order_item.unit_price }
    assert_redirected_to delivery_order_item_path(assigns(:delivery_order_item))
  end

  test "should destroy delivery_order_item" do
    assert_difference('DeliveryOrderItem.count', -1) do
      delete :destroy, id: @delivery_order_item
    end

    assert_redirected_to delivery_order_items_path
  end
end
