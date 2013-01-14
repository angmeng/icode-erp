require 'test_helper'

class CostingSheetFormulationsControllerTest < ActionController::TestCase
  setup do
    @costing_sheet_formulation = costing_sheet_formulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costing_sheet_formulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costing_sheet_formulation" do
    assert_difference('CostingSheetFormulation.count') do
      post :create, costing_sheet_formulation: { code: @costing_sheet_formulation.code, costing_sheet_id: @costing_sheet_formulation.costing_sheet_id, formula: @costing_sheet_formulation.formula }
    end

    assert_redirected_to costing_sheet_formulation_path(assigns(:costing_sheet_formulation))
  end

  test "should show costing_sheet_formulation" do
    get :show, id: @costing_sheet_formulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costing_sheet_formulation
    assert_response :success
  end

  test "should update costing_sheet_formulation" do
    put :update, id: @costing_sheet_formulation, costing_sheet_formulation: { code: @costing_sheet_formulation.code, costing_sheet_id: @costing_sheet_formulation.costing_sheet_id, formula: @costing_sheet_formulation.formula }
    assert_redirected_to costing_sheet_formulation_path(assigns(:costing_sheet_formulation))
  end

  test "should destroy costing_sheet_formulation" do
    assert_difference('CostingSheetFormulation.count', -1) do
      delete :destroy, id: @costing_sheet_formulation
    end

    assert_redirected_to costing_sheet_formulations_path
  end
end
