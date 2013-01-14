require 'test_helper'

class ReceiveNoteItemsControllerTest < ActionController::TestCase
  setup do
    @receive_note_item = receive_note_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_note_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_note_item" do
    assert_difference('ReceiveNoteItem.count') do
      post :create, receive_note_item: { balance_quantity: @receive_note_item.balance_quantity, current_stock: @receive_note_item.current_stock, order_quantity: @receive_note_item.order_quantity, purchase_order_id: @receive_note_item.purchase_order_id, receive_note_id: @receive_note_item.receive_note_id, received_quantity: @receive_note_item.received_quantity, status: @receive_note_item.status, vendor_part: @receive_note_item.vendor_part }
    end

    assert_redirected_to receive_note_item_path(assigns(:receive_note_item))
  end

  test "should show receive_note_item" do
    get :show, id: @receive_note_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_note_item
    assert_response :success
  end

  test "should update receive_note_item" do
    put :update, id: @receive_note_item, receive_note_item: { balance_quantity: @receive_note_item.balance_quantity, current_stock: @receive_note_item.current_stock, order_quantity: @receive_note_item.order_quantity, purchase_order_id: @receive_note_item.purchase_order_id, receive_note_id: @receive_note_item.receive_note_id, received_quantity: @receive_note_item.received_quantity, status: @receive_note_item.status, vendor_part: @receive_note_item.vendor_part }
    assert_redirected_to receive_note_item_path(assigns(:receive_note_item))
  end

  test "should destroy receive_note_item" do
    assert_difference('ReceiveNoteItem.count', -1) do
      delete :destroy, id: @receive_note_item
    end

    assert_redirected_to receive_note_items_path
  end
end
