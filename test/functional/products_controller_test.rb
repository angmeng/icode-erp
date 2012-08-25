require 'test_helper'

class PurchaseOrderItemsControllerTest < ActionController::TestCase
  setup do
    @purchase_order_item = purchase_order_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_item" do
    assert_difference('PurchaseOrderItem.count') do
      post :create, purchase_order_item: { code: @purchase_order_item.code, color_grade: @purchase_order_item.color_grade, current_stock: @purchase_order_item.current_stock, cutoff_date: @purchase_order_item.cutoff_date, desc: @purchase_order_item.desc, model: @purchase_order_item.model, opening_stock: @purchase_order_item.opening_stock, part_no: @purchase_order_item.part_no, part_weight: @purchase_order_item.part_weight, selling_price: @purchase_order_item.selling_price, tariff_code: @purchase_order_item.tariff_code, unit_measurement_id: @purchase_order_item.unit_measurement_id, version: @purchase_order_item.version }
    end

    assert_redirected_to purchase_order_item_path(assigns(:purchase_order_item))
  end

  test "should show purchase_order_item" do
    get :show, id: @purchase_order_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order_item
    assert_response :success
  end

  test "should update purchase_order_item" do
    put :update, id: @purchase_order_item, purchase_order_item: { code: @purchase_order_item.code, color_grade: @purchase_order_item.color_grade, current_stock: @purchase_order_item.current_stock, cutoff_date: @purchase_order_item.cutoff_date, desc: @purchase_order_item.desc, model: @purchase_order_item.model, opening_stock: @purchase_order_item.opening_stock, part_no: @purchase_order_item.part_no, part_weight: @purchase_order_item.part_weight, selling_price: @purchase_order_item.selling_price, tariff_code: @purchase_order_item.tariff_code, unit_measurement_id: @purchase_order_item.unit_measurement_id, version: @purchase_order_item.version }
    assert_redirected_to purchase_order_item_path(assigns(:purchase_order_item))
  end

  test "should destroy purchase_order_item" do
    assert_difference('PurchaseOrderItem.count', -1) do
      delete :destroy, id: @purchase_order_item
    end

    assert_redirected_to purchase_order_items_path
  end
end
