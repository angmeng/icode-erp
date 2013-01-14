require 'test_helper'

class ProductPricesControllerTest < ActionController::TestCase
  setup do
    @product_price = product_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_price" do
    assert_difference('ProductPrice.count') do
      post :create, product_price: { current_id: @product_price.current_id, price_in: @product_price.price_in, product_category_id: @product_price.product_category_id, trade_company_id: @product_price.trade_company_id, unit_price: @product_price.unit_price }
    end

    assert_redirected_to product_price_path(assigns(:product_price))
  end

  test "should show product_price" do
    get :show, id: @product_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_price
    assert_response :success
  end

  test "should update product_price" do
    put :update, id: @product_price, product_price: { current_id: @product_price.current_id, price_in: @product_price.price_in, product_category_id: @product_price.product_category_id, trade_company_id: @product_price.trade_company_id, unit_price: @product_price.unit_price }
    assert_redirected_to product_price_path(assigns(:product_price))
  end

  test "should destroy product_price" do
    assert_difference('ProductPrice.count', -1) do
      delete :destroy, id: @product_price
    end

    assert_redirected_to product_prices_path
  end
end
