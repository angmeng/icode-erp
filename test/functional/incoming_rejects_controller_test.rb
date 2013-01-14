require 'test_helper'

class IncomingRejectsControllerTest < ActionController::TestCase
  setup do
    @incoming_reject = incoming_rejects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incoming_rejects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incoming_reject" do
    assert_difference('IncomingReject.count') do
      post :create, incoming_reject: { balance_qty: @incoming_reject.balance_qty, bk_one: @incoming_reject.bk_one, client_part_no: @incoming_reject.client_part_no, current_stock: @incoming_reject.current_stock, incoming_reject_no: @incoming_reject.incoming_reject_no, job_order_no: @incoming_reject.job_order_no, order_qty: @incoming_reject.order_qty, purchase_requisition_item_id: @incoming_reject.purchase_requisition_item_id, purpose: @incoming_reject.purpose, returned_qty: @incoming_reject.returned_qty, updated_by: @incoming_reject.updated_by, vendor_delivery_no: @incoming_reject.vendor_delivery_no }
    end

    assert_redirected_to incoming_reject_path(assigns(:incoming_reject))
  end

  test "should show incoming_reject" do
    get :show, id: @incoming_reject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incoming_reject
    assert_response :success
  end

  test "should update incoming_reject" do
    put :update, id: @incoming_reject, incoming_reject: { balance_qty: @incoming_reject.balance_qty, bk_one: @incoming_reject.bk_one, client_part_no: @incoming_reject.client_part_no, current_stock: @incoming_reject.current_stock, incoming_reject_no: @incoming_reject.incoming_reject_no, job_order_no: @incoming_reject.job_order_no, order_qty: @incoming_reject.order_qty, purchase_requisition_item_id: @incoming_reject.purchase_requisition_item_id, purpose: @incoming_reject.purpose, returned_qty: @incoming_reject.returned_qty, updated_by: @incoming_reject.updated_by, vendor_delivery_no: @incoming_reject.vendor_delivery_no }
    assert_redirected_to incoming_reject_path(assigns(:incoming_reject))
  end

  test "should destroy incoming_reject" do
    assert_difference('IncomingReject.count', -1) do
      delete :destroy, id: @incoming_reject
    end

    assert_redirected_to incoming_rejects_path
  end
end
