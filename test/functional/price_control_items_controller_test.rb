require 'test_helper'

class PriceControlItemsControllerTest < ActionController::TestCase
  setup do
    @price_control_item = price_control_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_control_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_control_item" do
    assert_difference('PriceControlItem.count') do
      post :create, price_control_item: { new_eff_date: @price_control_item.new_eff_date, new_unit_price: @price_control_item.new_unit_price, old_eff_date: @price_control_item.old_eff_date, old_unit_price: @price_control_item.old_unit_price, part_no: @price_control_item.part_no, product_id: @price_control_item.product_id, status: @price_control_item.status }
    end

    assert_redirected_to price_control_item_path(assigns(:price_control_item))
  end

  test "should show price_control_item" do
    get :show, id: @price_control_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @price_control_item
    assert_response :success
  end

  test "should update price_control_item" do
    put :update, id: @price_control_item, price_control_item: { new_eff_date: @price_control_item.new_eff_date, new_unit_price: @price_control_item.new_unit_price, old_eff_date: @price_control_item.old_eff_date, old_unit_price: @price_control_item.old_unit_price, part_no: @price_control_item.part_no, product_id: @price_control_item.product_id, status: @price_control_item.status }
    assert_redirected_to price_control_item_path(assigns(:price_control_item))
  end

  test "should destroy price_control_item" do
    assert_difference('PriceControlItem.count', -1) do
      delete :destroy, id: @price_control_item
    end

    assert_redirected_to price_control_items_path
  end
end
