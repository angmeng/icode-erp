require 'test_helper'

class PurchaseRequisitionsControllerTest < ActionController::TestCase
  setup do
    @purchase_requisition = purchase_requisitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_requisitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_requisition" do
    assert_difference('PurchaseRequisition.count') do
      post :create, purchase_requisition: { description: @purchase_requisition.description, eta: @purchase_requisition.eta, pr_no: @purchase_requisition.pr_no, product_id: @purchase_requisition.product_id, purchase_date: @purchase_requisition.purchase_date, purchase_order_no: @purchase_requisition.purchase_order_no, quantity: @purchase_requisition.quantity, remark: @purchase_requisition.remark, status: @purchase_requisition.status, trade_company_id: @purchase_requisition.trade_company_id, unit_measurement_id: @purchase_requisition.unit_measurement_id, unit_price: @purchase_requisition.unit_price }
    end

    assert_redirected_to purchase_requisition_path(assigns(:purchase_requisition))
  end

  test "should show purchase_requisition" do
    get :show, id: @purchase_requisition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_requisition
    assert_response :success
  end

  test "should update purchase_requisition" do
    put :update, id: @purchase_requisition, purchase_requisition: { description: @purchase_requisition.description, eta: @purchase_requisition.eta, pr_no: @purchase_requisition.pr_no, product_id: @purchase_requisition.product_id, purchase_date: @purchase_requisition.purchase_date, purchase_order_no: @purchase_requisition.purchase_order_no, quantity: @purchase_requisition.quantity, remark: @purchase_requisition.remark, status: @purchase_requisition.status, trade_company_id: @purchase_requisition.trade_company_id, unit_measurement_id: @purchase_requisition.unit_measurement_id, unit_price: @purchase_requisition.unit_price }
    assert_redirected_to purchase_requisition_path(assigns(:purchase_requisition))
  end

  test "should destroy purchase_requisition" do
    assert_difference('PurchaseRequisition.count', -1) do
      delete :destroy, id: @purchase_requisition
    end

    assert_redirected_to purchase_requisitions_path
  end
end
