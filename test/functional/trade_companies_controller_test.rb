require 'test_helper'

class TradeCompaniesControllerTest < ActionController::TestCase
  setup do
    @trade_company = trade_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trade_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade_company" do
    assert_difference('TradeCompany.count') do
      post :create, trade_company: { address_1: @trade_company.address_1, address_2: @trade_company.address_2, address_3: @trade_company.address_3, code: @trade_company.code, contact_person: @trade_company.contact_person, fax_no: @trade_company.fax_no, name: @trade_company.name, sales_rep: @trade_company.sales_rep, sales_tax_exemption: @trade_company.sales_tax_exemption, sales_tax_no: @trade_company.sales_tax_no, status: @trade_company.status, tel_no_1: @trade_company.tel_no_1, tel_no_2: @trade_company.tel_no_2, trade_term: @trade_company.trade_term, type_of_sales: @trade_company.type_of_sales }
    end

    assert_redirected_to trade_company_path(assigns(:trade_company))
  end

  test "should show trade_company" do
    get :show, id: @trade_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade_company
    assert_response :success
  end

  test "should update trade_company" do
    put :update, id: @trade_company, trade_company: { address_1: @trade_company.address_1, address_2: @trade_company.address_2, address_3: @trade_company.address_3, code: @trade_company.code, contact_person: @trade_company.contact_person, fax_no: @trade_company.fax_no, name: @trade_company.name, sales_rep: @trade_company.sales_rep, sales_tax_exemption: @trade_company.sales_tax_exemption, sales_tax_no: @trade_company.sales_tax_no, status: @trade_company.status, tel_no_1: @trade_company.tel_no_1, tel_no_2: @trade_company.tel_no_2, trade_term: @trade_company.trade_term, type_of_sales: @trade_company.type_of_sales }
    assert_redirected_to trade_company_path(assigns(:trade_company))
  end

  test "should destroy trade_company" do
    assert_difference('TradeCompany.count', -1) do
      delete :destroy, id: @trade_company
    end

    assert_redirected_to trade_companies_path
  end
end
