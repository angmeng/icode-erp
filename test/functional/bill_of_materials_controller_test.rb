require 'test_helper'

class BillOfMaterialsControllerTest < ActionController::TestCase
  setup do
    @bill_of_material = bill_of_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_of_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_of_material" do
    assert_difference('BillOfMaterial.count') do
      post :create, bill_of_material: { bom_no: @bill_of_material.bom_no, sales_order_item_id: @bill_of_material.sales_order_item_id, type: @bill_of_material.type }
    end

    assert_redirected_to bill_of_material_path(assigns(:bill_of_material))
  end

  test "should show bill_of_material" do
    get :show, id: @bill_of_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_of_material
    assert_response :success
  end

  test "should update bill_of_material" do
    put :update, id: @bill_of_material, bill_of_material: { bom_no: @bill_of_material.bom_no, sales_order_item_id: @bill_of_material.sales_order_item_id, type: @bill_of_material.type }
    assert_redirected_to bill_of_material_path(assigns(:bill_of_material))
  end

  test "should destroy bill_of_material" do
    assert_difference('BillOfMaterial.count', -1) do
      delete :destroy, id: @bill_of_material
    end

    assert_redirected_to bill_of_materials_path
  end
end
