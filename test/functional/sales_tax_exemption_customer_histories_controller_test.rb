require 'test_helper'

class SalesTaxExemptionCustomerHistoriesControllerTest < ActionController::TestCase
  setup do
    @sales_tax_exemption_customer_history = sales_tax_exemption_customer_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_tax_exemption_customer_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax_exemption_customer_history" do
    assert_difference('SalesTaxExemptionCustomerHistory.count') do
      post :create, sales_tax_exemption_customer_history: { delivery_order_item_id: @sales_tax_exemption_customer_history.delivery_order_item_id, sales_tax_exemption_id: @sales_tax_exemption_customer_history.sales_tax_exemption_id, trade_company_id: @sales_tax_exemption_customer_history.trade_company_id, unit_measurement_id: @sales_tax_exemption_customer_history.unit_measurement_id, used_date: @sales_tax_exemption_customer_history.used_date, used_qty: @sales_tax_exemption_customer_history.used_qty }
    end

    assert_redirected_to sales_tax_exemption_customer_history_path(assigns(:sales_tax_exemption_customer_history))
  end

  test "should show sales_tax_exemption_customer_history" do
    get :show, id: @sales_tax_exemption_customer_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax_exemption_customer_history
    assert_response :success
  end

  test "should update sales_tax_exemption_customer_history" do
    put :update, id: @sales_tax_exemption_customer_history, sales_tax_exemption_customer_history: { delivery_order_item_id: @sales_tax_exemption_customer_history.delivery_order_item_id, sales_tax_exemption_id: @sales_tax_exemption_customer_history.sales_tax_exemption_id, trade_company_id: @sales_tax_exemption_customer_history.trade_company_id, unit_measurement_id: @sales_tax_exemption_customer_history.unit_measurement_id, used_date: @sales_tax_exemption_customer_history.used_date, used_qty: @sales_tax_exemption_customer_history.used_qty }
    assert_redirected_to sales_tax_exemption_customer_history_path(assigns(:sales_tax_exemption_customer_history))
  end

  test "should destroy sales_tax_exemption_customer_history" do
    assert_difference('SalesTaxExemptionCustomerHistory.count', -1) do
      delete :destroy, id: @sales_tax_exemption_customer_history
    end

    assert_redirected_to sales_tax_exemption_customer_histories_path
  end
end
