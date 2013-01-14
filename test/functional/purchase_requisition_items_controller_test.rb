require 'test_helper'

class PurchaseRequisitionItemsControllerTest < ActionController::TestCase
  setup do
    @purchase_requisition_item = purchase_requisition_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_requisition_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_requisition_item" do
    assert_difference('PurchaseRequisitionItem.count') do
      post :create, purchase_requisition_item: { description: @purchase_requisition_item.description, eta: @purchase_requisition_item.eta, product_id: @purchase_requisition_item.product_id, purchase_order_no: @purchase_requisition_item.purchase_order_no, purchase_requisition_id: @purchase_requisition_item.purchase_requisition_id, quantity: @purchase_requisition_item.quantity, remark: @purchase_requisition_item.remark, trade_company_id: @purchase_requisition_item.trade_company_id, unit_measurement_id: @purchase_requisition_item.unit_measurement_id, unit_price: @purchase_requisition_item.unit_price }
    end

    assert_redirected_to purchase_requisition_item_path(assigns(:purchase_requisition_item))
  end

  test "should show purchase_requisition_item" do
    get :show, id: @purchase_requisition_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_requisition_item
    assert_response :success
  end

  test "should update purchase_requisition_item" do
    put :update, id: @purchase_requisition_item, purchase_requisition_item: { description: @purchase_requisition_item.description, eta: @purchase_requisition_item.eta, product_id: @purchase_requisition_item.product_id, purchase_order_no: @purchase_requisition_item.purchase_order_no, purchase_requisition_id: @purchase_requisition_item.purchase_requisition_id, quantity: @purchase_requisition_item.quantity, remark: @purchase_requisition_item.remark, trade_company_id: @purchase_requisition_item.trade_company_id, unit_measurement_id: @purchase_requisition_item.unit_measurement_id, unit_price: @purchase_requisition_item.unit_price }
    assert_redirected_to purchase_requisition_item_path(assigns(:purchase_requisition_item))
  end

  test "should destroy purchase_requisition_item" do
    assert_difference('PurchaseRequisitionItem.count', -1) do
      delete :destroy, id: @purchase_requisition_item
    end

    assert_redirected_to purchase_requisition_items_path
  end
end
