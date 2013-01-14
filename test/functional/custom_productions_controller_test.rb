require 'test_helper'

class CustomProductionsControllerTest < ActionController::TestCase
  setup do
    @custom_production = custom_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_production" do
    assert_difference('CustomProduction.count') do
      post :create, custom_production: { category_no: @custom_production.category_no, lot_size: @custom_production.lot_size, part_no: @custom_production.part_no, stock_reference: @custom_production.stock_reference }
    end

    assert_redirected_to custom_production_path(assigns(:custom_production))
  end

  test "should show custom_production" do
    get :show, id: @custom_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @custom_production
    assert_response :success
  end

  test "should update custom_production" do
    put :update, id: @custom_production, custom_production: { category_no: @custom_production.category_no, lot_size: @custom_production.lot_size, part_no: @custom_production.part_no, stock_reference: @custom_production.stock_reference }
    assert_redirected_to custom_production_path(assigns(:custom_production))
  end

  test "should destroy custom_production" do
    assert_difference('CustomProduction.count', -1) do
      delete :destroy, id: @custom_production
    end

    assert_redirected_to custom_productions_path
  end
end
