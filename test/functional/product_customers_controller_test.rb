require 'test_helper'

class ProductCustomersControllerTest < ActionController::TestCase
  setup do
    @product_customer = product_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_customer" do
    assert_difference('ProductCustomer.count') do
      post :create, product_customer: { product_id: @product_customer.product_id, selling_price: @product_customer.selling_price, trade_company_id: @product_customer.trade_company_id }
    end

    assert_redirected_to product_customer_path(assigns(:product_customer))
  end

  test "should show product_customer" do
    get :show, id: @product_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_customer
    assert_response :success
  end

  test "should update product_customer" do
    put :update, id: @product_customer, product_customer: { product_id: @product_customer.product_id, selling_price: @product_customer.selling_price, trade_company_id: @product_customer.trade_company_id }
    assert_redirected_to product_customer_path(assigns(:product_customer))
  end

  test "should destroy product_customer" do
    assert_difference('ProductCustomer.count', -1) do
      delete :destroy, id: @product_customer
    end

    assert_redirected_to product_customers_path
  end
end
