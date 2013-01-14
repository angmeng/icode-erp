require 'test_helper'

class TypeOfSalesControllerTest < ActionController::TestCase
  setup do
    @type_of_sale = type_of_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_sale" do
    assert_difference('TypeOfSale.count') do
      post :create, type_of_sale: { description: @type_of_sale.description, name: @type_of_sale.name }
    end

    assert_redirected_to type_of_sale_path(assigns(:type_of_sale))
  end

  test "should show type_of_sale" do
    get :show, id: @type_of_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_sale
    assert_response :success
  end

  test "should update type_of_sale" do
    put :update, id: @type_of_sale, type_of_sale: { description: @type_of_sale.description, name: @type_of_sale.name }
    assert_redirected_to type_of_sale_path(assigns(:type_of_sale))
  end

  test "should destroy type_of_sale" do
    assert_difference('TypeOfSale.count', -1) do
      delete :destroy, id: @type_of_sale
    end

    assert_redirected_to type_of_sales_path
  end
end
