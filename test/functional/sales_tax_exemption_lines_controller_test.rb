require 'test_helper'

class SalesTaxExemptionLinesControllerTest < ActionController::TestCase
  setup do
    @sales_tax_exemption_line = sales_tax_exemption_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_tax_exemption_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax_exemption_line" do
    assert_difference('SalesTaxExemptionLine.count') do
      post :create, sales_tax_exemption_line: { sales_tax_exemption_id: @sales_tax_exemption_line.sales_tax_exemption_id, trade_company_id: @sales_tax_exemption_line.trade_company_id, validate_condition: @sales_tax_exemption_line.validate_condition }
    end

    assert_redirected_to sales_tax_exemption_line_path(assigns(:sales_tax_exemption_line))
  end

  test "should show sales_tax_exemption_line" do
    get :show, id: @sales_tax_exemption_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax_exemption_line
    assert_response :success
  end

  test "should update sales_tax_exemption_line" do
    put :update, id: @sales_tax_exemption_line, sales_tax_exemption_line: { sales_tax_exemption_id: @sales_tax_exemption_line.sales_tax_exemption_id, trade_company_id: @sales_tax_exemption_line.trade_company_id, validate_condition: @sales_tax_exemption_line.validate_condition }
    assert_redirected_to sales_tax_exemption_line_path(assigns(:sales_tax_exemption_line))
  end

  test "should destroy sales_tax_exemption_line" do
    assert_difference('SalesTaxExemptionLine.count', -1) do
      delete :destroy, id: @sales_tax_exemption_line
    end

    assert_redirected_to sales_tax_exemption_lines_path
  end
end
