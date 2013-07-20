require 'test_helper'

class OutgoingRejectItemsControllerTest < ActionController::TestCase
  setup do
    @outgoing_reject_item = outgoing_reject_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_reject_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_reject_item" do
    assert_difference('OutgoingRejectItem.count') do
      post :create, outgoing_reject_item: { client_lot: @outgoing_reject_item.client_lot, client_part: @outgoing_reject_item.client_part, client_po: @outgoing_reject_item.client_po, current_stock: @outgoing_reject_item.current_stock, delivery_order_item_id: @outgoing_reject_item.delivery_order_item_id, invoice_delivery_qty: @outgoing_reject_item.invoice_delivery_qty, invoice_unit_price: @outgoing_reject_item.invoice_unit_price, quantity: @outgoing_reject_item.quantity, received_qty: @outgoing_reject_item.received_qty, so_balance_qty: @outgoing_reject_item.so_balance_qty, status: @outgoing_reject_item.status }
    end

    assert_redirected_to outgoing_reject_item_path(assigns(:outgoing_reject_item))
  end

  test "should show outgoing_reject_item" do
    get :show, id: @outgoing_reject_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outgoing_reject_item
    assert_response :success
  end

  test "should update outgoing_reject_item" do
    put :update, id: @outgoing_reject_item, outgoing_reject_item: { client_lot: @outgoing_reject_item.client_lot, client_part: @outgoing_reject_item.client_part, client_po: @outgoing_reject_item.client_po, current_stock: @outgoing_reject_item.current_stock, delivery_order_item_id: @outgoing_reject_item.delivery_order_item_id, invoice_delivery_qty: @outgoing_reject_item.invoice_delivery_qty, invoice_unit_price: @outgoing_reject_item.invoice_unit_price, quantity: @outgoing_reject_item.quantity, received_qty: @outgoing_reject_item.received_qty, so_balance_qty: @outgoing_reject_item.so_balance_qty, status: @outgoing_reject_item.status }
    assert_redirected_to outgoing_reject_item_path(assigns(:outgoing_reject_item))
  end

  test "should destroy outgoing_reject_item" do
    assert_difference('OutgoingRejectItem.count', -1) do
      delete :destroy, id: @outgoing_reject_item
    end

    assert_redirected_to outgoing_reject_items_path
  end
end
