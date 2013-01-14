require 'test_helper'

class ProductFieldsControllerTest < ActionController::TestCase
  setup do
    @product_field = product_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_field" do
    assert_difference('ProductField.count') do
      post :create, product_field: { category_id: @product_field.category_id, field_id: @product_field.field_id }
    end

    assert_redirected_to product_field_path(assigns(:product_field))
  end

  test "should show product_field" do
    get :show, id: @product_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_field
    assert_response :success
  end

  test "should update product_field" do
    put :update, id: @product_field, product_field: { category_id: @product_field.category_id, field_id: @product_field.field_id }
    assert_redirected_to product_field_path(assigns(:product_field))
  end

  test "should destroy product_field" do
    assert_difference('ProductField.count', -1) do
      delete :destroy, id: @product_field
    end

    assert_redirected_to product_fields_path
  end
end
