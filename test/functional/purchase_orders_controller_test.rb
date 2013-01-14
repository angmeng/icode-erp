require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order" do
    assert_difference('PurchaseOrder.count') do
      post :create, purchase_order: { currency_id: @purchase_order.currency_id, po_date: @purchase_order.po_date, po_no: @purchase_order.po_no, purchase_by: @purchase_order.purchase_by, request_by: @purchase_order.request_by, revision: @purchase_order.revision, tax: @purchase_order.tax, trade_company_id: @purchase_order.trade_company_id, trade_term_id: @purchase_order.trade_term_id, transport_id: @purchase_order.transport_id, updated_by: @purchase_order.updated_by, user_id: @purchase_order.user_id, verify: @purchase_order.verify }
    end

    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should show purchase_order" do
    get :show, id: @purchase_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order
    assert_response :success
  end

  test "should update purchase_order" do
    put :update, id: @purchase_order, purchase_order: { currency_id: @purchase_order.currency_id, po_date: @purchase_order.po_date, po_no: @purchase_order.po_no, purchase_by: @purchase_order.purchase_by, request_by: @purchase_order.request_by, revision: @purchase_order.revision, tax: @purchase_order.tax, trade_company_id: @purchase_order.trade_company_id, trade_term_id: @purchase_order.trade_term_id, transport_id: @purchase_order.transport_id, updated_by: @purchase_order.updated_by, user_id: @purchase_order.user_id, verify: @purchase_order.verify }
    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should destroy purchase_order" do
    assert_difference('PurchaseOrder.count', -1) do
      delete :destroy, id: @purchase_order
    end

    assert_redirected_to purchase_orders_path
  end
end
