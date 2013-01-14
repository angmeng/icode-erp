require 'test_helper'

class MaterialOfQuantitiesControllerTest < ActionController::TestCase
  setup do
    @material_of_quantity = material_of_quantities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_of_quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_of_quantity" do
    assert_difference('MaterialOfQuantity.count') do
      post :create, material_of_quantity: { quantity: @material_of_quantity.quantity, quotation_request_form_id: @material_of_quantity.quotation_request_form_id, unit_price: @material_of_quantity.unit_price }
    end

    assert_redirected_to material_of_quantity_path(assigns(:material_of_quantity))
  end

  test "should show material_of_quantity" do
    get :show, id: @material_of_quantity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_of_quantity
    assert_response :success
  end

  test "should update material_of_quantity" do
    put :update, id: @material_of_quantity, material_of_quantity: { quantity: @material_of_quantity.quantity, quotation_request_form_id: @material_of_quantity.quotation_request_form_id, unit_price: @material_of_quantity.unit_price }
    assert_redirected_to material_of_quantity_path(assigns(:material_of_quantity))
  end

  test "should destroy material_of_quantity" do
    assert_difference('MaterialOfQuantity.count', -1) do
      delete :destroy, id: @material_of_quantity
    end

    assert_redirected_to material_of_quantities_path
  end
end
