require 'test_helper'

class ProductComboboxesControllerTest < ActionController::TestCase
  setup do
    @product_combobox = product_comboboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_comboboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_combobox" do
    assert_difference('ProductCombobox.count') do
      post :create, product_combobox: { product_code: @product_combobox.product_code, product_id: @product_combobox.product_id }
    end

    assert_redirected_to product_combobox_path(assigns(:product_combobox))
  end

  test "should show product_combobox" do
    get :show, id: @product_combobox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_combobox
    assert_response :success
  end

  test "should update product_combobox" do
    put :update, id: @product_combobox, product_combobox: { product_code: @product_combobox.product_code, product_id: @product_combobox.product_id }
    assert_redirected_to product_combobox_path(assigns(:product_combobox))
  end

  test "should destroy product_combobox" do
    assert_difference('ProductCombobox.count', -1) do
      delete :destroy, id: @product_combobox
    end

    assert_redirected_to product_comboboxes_path
  end
end
