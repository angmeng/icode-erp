require 'test_helper'

class ProductRunningNumbersControllerTest < ActionController::TestCase
  setup do
    @product_running_number = product_running_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_running_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_running_number" do
    assert_difference('ProductRunningNumber.count') do
      post :create, product_running_number: { base_name: @product_running_number.base_name, running_no: @product_running_number.running_no, sub_name: @product_running_number.sub_name }
    end

    assert_redirected_to product_running_number_path(assigns(:product_running_number))
  end

  test "should show product_running_number" do
    get :show, id: @product_running_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_running_number
    assert_response :success
  end

  test "should update product_running_number" do
    put :update, id: @product_running_number, product_running_number: { base_name: @product_running_number.base_name, running_no: @product_running_number.running_no, sub_name: @product_running_number.sub_name }
    assert_redirected_to product_running_number_path(assigns(:product_running_number))
  end

  test "should destroy product_running_number" do
    assert_difference('ProductRunningNumber.count', -1) do
      delete :destroy, id: @product_running_number
    end

    assert_redirected_to product_running_numbers_path
  end
end
