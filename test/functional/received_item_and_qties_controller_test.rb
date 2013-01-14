require 'test_helper'

class ReceivedItemAndQtiesControllerTest < ActionController::TestCase
  setup do
    @received_item_and_qty = received_item_and_qties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:received_item_and_qties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create received_item_and_qty" do
    assert_difference('ReceivedItemAndQty.count') do
      post :create, received_item_and_qty: { purchase_order_item_line_id: @received_item_and_qty.purchase_order_item_line_id, receive_note_id: @received_item_and_qty.receive_note_id, received_qty: @received_item_and_qty.received_qty }
    end

    assert_redirected_to received_item_and_qty_path(assigns(:received_item_and_qty))
  end

  test "should show received_item_and_qty" do
    get :show, id: @received_item_and_qty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @received_item_and_qty
    assert_response :success
  end

  test "should update received_item_and_qty" do
    put :update, id: @received_item_and_qty, received_item_and_qty: { purchase_order_item_line_id: @received_item_and_qty.purchase_order_item_line_id, receive_note_id: @received_item_and_qty.receive_note_id, received_qty: @received_item_and_qty.received_qty }
    assert_redirected_to received_item_and_qty_path(assigns(:received_item_and_qty))
  end

  test "should destroy received_item_and_qty" do
    assert_difference('ReceivedItemAndQty.count', -1) do
      delete :destroy, id: @received_item_and_qty
    end

    assert_redirected_to received_item_and_qties_path
  end
end
