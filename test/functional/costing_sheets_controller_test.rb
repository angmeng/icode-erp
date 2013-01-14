require 'test_helper'

class CostingSheetsControllerTest < ActionController::TestCase
  setup do
    @costing_sheet = costing_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costing_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costing_sheet" do
    assert_difference('CostingSheet.count') do
      post :create, costing_sheet: { collating_price: @costing_sheet.collating_price, color_price: @costing_sheet.color_price, die_cut_price: @costing_sheet.die_cut_price, folding_price: @costing_sheet.folding_price, glueing_price: @costing_sheet.glueing_price, lamination_price: @costing_sheet.lamination_price, material_price: @costing_sheet.material_price, packing_price: @costing_sheet.packing_price, quotation_request_form_id: @costing_sheet.quotation_request_form_id, stamping_price: @costing_sheet.stamping_price, surface_finishing_price: @costing_sheet.surface_finishing_price, wax_price: @costing_sheet.wax_price, window_patching_price: @costing_sheet.window_patching_price }
    end

    assert_redirected_to costing_sheet_path(assigns(:costing_sheet))
  end

  test "should show costing_sheet" do
    get :show, id: @costing_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costing_sheet
    assert_response :success
  end

  test "should update costing_sheet" do
    put :update, id: @costing_sheet, costing_sheet: { collating_price: @costing_sheet.collating_price, color_price: @costing_sheet.color_price, die_cut_price: @costing_sheet.die_cut_price, folding_price: @costing_sheet.folding_price, glueing_price: @costing_sheet.glueing_price, lamination_price: @costing_sheet.lamination_price, material_price: @costing_sheet.material_price, packing_price: @costing_sheet.packing_price, quotation_request_form_id: @costing_sheet.quotation_request_form_id, stamping_price: @costing_sheet.stamping_price, surface_finishing_price: @costing_sheet.surface_finishing_price, wax_price: @costing_sheet.wax_price, window_patching_price: @costing_sheet.window_patching_price }
    assert_redirected_to costing_sheet_path(assigns(:costing_sheet))
  end

  test "should destroy costing_sheet" do
    assert_difference('CostingSheet.count', -1) do
      delete :destroy, id: @costing_sheet
    end

    assert_redirected_to costing_sheets_path
  end
end
