require 'test_helper'

class SteCustomerHistoriesControllerTest < ActionController::TestCase
  setup do
    @ste_customer_history = ste_customer_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ste_customer_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ste_customer_history" do
    assert_difference('SteCustomerHistory.count') do
      post :create, ste_customer_history: { accumulative_complete_qty: @ste_customer_history.accumulative_complete_qty, after_available_qty: @ste_customer_history.after_available_qty, before_available_qty: @ste_customer_history.before_available_qty, delivery_order_item_id: @ste_customer_history.delivery_order_item_id, delivery_qty: @ste_customer_history.delivery_qty, pc_weight: @ste_customer_history.pc_weight, product_id: @ste_customer_history.product_id, sales_tax_exemption_id: @ste_customer_history.sales_tax_exemption_id, trade_company_id: @ste_customer_history.trade_company_id, unit_measurement_id: @ste_customer_history.unit_measurement_id, used_date: @ste_customer_history.used_date }
    end

    assert_redirected_to ste_customer_history_path(assigns(:ste_customer_history))
  end

  test "should show ste_customer_history" do
    get :show, id: @ste_customer_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ste_customer_history
    assert_response :success
  end

  test "should update ste_customer_history" do
    put :update, id: @ste_customer_history, ste_customer_history: { accumulative_complete_qty: @ste_customer_history.accumulative_complete_qty, after_available_qty: @ste_customer_history.after_available_qty, before_available_qty: @ste_customer_history.before_available_qty, delivery_order_item_id: @ste_customer_history.delivery_order_item_id, delivery_qty: @ste_customer_history.delivery_qty, pc_weight: @ste_customer_history.pc_weight, product_id: @ste_customer_history.product_id, sales_tax_exemption_id: @ste_customer_history.sales_tax_exemption_id, trade_company_id: @ste_customer_history.trade_company_id, unit_measurement_id: @ste_customer_history.unit_measurement_id, used_date: @ste_customer_history.used_date }
    assert_redirected_to ste_customer_history_path(assigns(:ste_customer_history))
  end

  test "should destroy ste_customer_history" do
    assert_difference('SteCustomerHistory.count', -1) do
      delete :destroy, id: @ste_customer_history
    end

    assert_redirected_to ste_customer_histories_path
  end
end
