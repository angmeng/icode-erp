require 'test_helper'

class CustomsControllerTest < ActionController::TestCase
  setup do
    @custom = customs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom" do
    assert_difference('Custom.count') do
      post :create, custom: { apply_qty: @custom.apply_qty, complete_qty: @custom.complete_qty, period_end: @custom.period_end, period_start: @custom.period_start, sales_tax_exemption: @custom.sales_tax_exemption, tarif_code: @custom.tarif_code, trade_company_id: @custom.trade_company_id, unit_measurement_id: @custom.unit_measurement_id }
    end

    assert_redirected_to custom_path(assigns(:custom))
  end

  test "should show custom" do
    get :show, id: @custom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom
    assert_response :success
  end

  test "should update custom" do
    put :update, id: @custom, custom: { apply_qty: @custom.apply_qty, complete_qty: @custom.complete_qty, period_end: @custom.period_end, period_start: @custom.period_start, sales_tax_exemption: @custom.sales_tax_exemption, tarif_code: @custom.tarif_code, trade_company_id: @custom.trade_company_id, unit_measurement_id: @custom.unit_measurement_id }
    assert_redirected_to custom_path(assigns(:custom))
  end

  test "should destroy custom" do
    assert_difference('Custom.count', -1) do
      delete :destroy, id: @custom
    end

    assert_redirected_to customs_path
  end
end
