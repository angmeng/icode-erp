require 'test_helper'

class PackingQuantitiesControllerTest < ActionController::TestCase
  setup do
    @packing_quantity = packing_quantities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packing_quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packing_quantity" do
    assert_difference('PackingQuantity.count') do
      post :create, packing_quantity: { per: @packing_quantity.per, quantity: @packing_quantity.quantity }
    end

    assert_redirected_to packing_quantity_path(assigns(:packing_quantity))
  end

  test "should show packing_quantity" do
    get :show, id: @packing_quantity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packing_quantity
    assert_response :success
  end

  test "should update packing_quantity" do
    put :update, id: @packing_quantity, packing_quantity: { per: @packing_quantity.per, quantity: @packing_quantity.quantity }
    assert_redirected_to packing_quantity_path(assigns(:packing_quantity))
  end

  test "should destroy packing_quantity" do
    assert_difference('PackingQuantity.count', -1) do
      delete :destroy, id: @packing_quantity
    end

    assert_redirected_to packing_quantities_path
  end
end
