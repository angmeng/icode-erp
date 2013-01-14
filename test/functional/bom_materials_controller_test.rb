require 'test_helper'

class BomMaterialsControllerTest < ActionController::TestCase
  setup do
    @bom_material = bom_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bom_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bom_material" do
    assert_difference('BomMaterial.count') do
      post :create, bom_material: { bill_of_material_id: @bom_material.bill_of_material_id, material_id: @bom_material.material_id }
    end

    assert_redirected_to bom_material_path(assigns(:bom_material))
  end

  test "should show bom_material" do
    get :show, id: @bom_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bom_material
    assert_response :success
  end

  test "should update bom_material" do
    put :update, id: @bom_material, bom_material: { bill_of_material_id: @bom_material.bill_of_material_id, material_id: @bom_material.material_id }
    assert_redirected_to bom_material_path(assigns(:bom_material))
  end

  test "should destroy bom_material" do
    assert_difference('BomMaterial.count', -1) do
      delete :destroy, id: @bom_material
    end

    assert_redirected_to bom_materials_path
  end
end
