require 'test_helper'

class SalesTaxExemptionsControllerTest < ActionController::TestCase
  setup do
    @sales_tax_exemption = sales_tax_exemptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_tax_exemptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax_exemption" do
    assert_difference('SalesTaxExemption.count') do
      post :create, sales_tax_exemption: { apply_qty: @sales_tax_exemption.apply_qty, complete_qty: @sales_tax_exemption.complete_qty, license_no: @sales_tax_exemption.license_no, period_end: @sales_tax_exemption.period_end, period_start: @sales_tax_exemption.period_start, sales_tax_exemption_no: @sales_tax_exemption.sales_tax_exemption_no, tarif_code: @sales_tax_exemption.tarif_code, trade_company_id: @sales_tax_exemption.trade_company_id, unit_measurement_id: @sales_tax_exemption.unit_measurement_id }
    end

    assert_redirected_to sales_tax_exemption_path(assigns(:sales_tax_exemption))
  end

  test "should show sales_tax_exemption" do
    get :show, id: @sales_tax_exemption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax_exemption
    assert_response :success
  end

  test "should update sales_tax_exemption" do
    put :update, id: @sales_tax_exemption, sales_tax_exemption: { apply_qty: @sales_tax_exemption.apply_qty, complete_qty: @sales_tax_exemption.complete_qty, license_no: @sales_tax_exemption.license_no, period_end: @sales_tax_exemption.period_end, period_start: @sales_tax_exemption.period_start, sales_tax_exemption_no: @sales_tax_exemption.sales_tax_exemption_no, tarif_code: @sales_tax_exemption.tarif_code, trade_company_id: @sales_tax_exemption.trade_company_id, unit_measurement_id: @sales_tax_exemption.unit_measurement_id }
    assert_redirected_to sales_tax_exemption_path(assigns(:sales_tax_exemption))
  end

  test "should destroy sales_tax_exemption" do
    assert_difference('SalesTaxExemption.count', -1) do
      delete :destroy, id: @sales_tax_exemption
    end

    assert_redirected_to sales_tax_exemptions_path
  end
end
