require 'test_helper'

class SteSupplierHistoriesControllerTest < ActionController::TestCase
  setup do
    @ste_supplier_history = ste_supplier_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ste_supplier_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ste_supplier_history" do
    assert_difference('SteSupplierHistory.count') do
      post :create, ste_supplier_history: { accumulative_complete_qty: @ste_supplier_history.accumulative_complete_qty, after_available_qty: @ste_supplier_history.after_available_qty, before_available_qty: @ste_supplier_history.before_available_qty, product_id: @ste_supplier_history.product_id, purchase_order_id: @ste_supplier_history.purchase_order_id, sales_tax_exemption_id: @ste_supplier_history.sales_tax_exemption_id }
    end

    assert_redirected_to ste_supplier_history_path(assigns(:ste_supplier_history))
  end

  test "should show ste_supplier_history" do
    get :show, id: @ste_supplier_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ste_supplier_history
    assert_response :success
  end

  test "should update ste_supplier_history" do
    put :update, id: @ste_supplier_history, ste_supplier_history: { accumulative_complete_qty: @ste_supplier_history.accumulative_complete_qty, after_available_qty: @ste_supplier_history.after_available_qty, before_available_qty: @ste_supplier_history.before_available_qty, product_id: @ste_supplier_history.product_id, purchase_order_id: @ste_supplier_history.purchase_order_id, sales_tax_exemption_id: @ste_supplier_history.sales_tax_exemption_id }
    assert_redirected_to ste_supplier_history_path(assigns(:ste_supplier_history))
  end

  test "should destroy ste_supplier_history" do
    assert_difference('SteSupplierHistory.count', -1) do
      delete :destroy, id: @ste_supplier_history
    end

    assert_redirected_to ste_supplier_histories_path
  end
end
