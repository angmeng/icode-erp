require 'test_helper'

class SelectionDieCutMouldsControllerTest < ActionController::TestCase
  setup do
    @selection_die_cut_mould = selection_die_cut_moulds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_die_cut_moulds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_die_cut_mould" do
    assert_difference('SelectionDieCutMould.count') do
      post :create, selection_die_cut_mould: { mould_no: @selection_die_cut_mould.mould_no, quotation_request_form_id: @selection_die_cut_mould.quotation_request_form_id, window_no: @selection_die_cut_mould.window_no }
    end

    assert_redirected_to selection_die_cut_mould_path(assigns(:selection_die_cut_mould))
  end

  test "should show selection_die_cut_mould" do
    get :show, id: @selection_die_cut_mould
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_die_cut_mould
    assert_response :success
  end

  test "should update selection_die_cut_mould" do
    put :update, id: @selection_die_cut_mould, selection_die_cut_mould: { mould_no: @selection_die_cut_mould.mould_no, quotation_request_form_id: @selection_die_cut_mould.quotation_request_form_id, window_no: @selection_die_cut_mould.window_no }
    assert_redirected_to selection_die_cut_mould_path(assigns(:selection_die_cut_mould))
  end

  test "should destroy selection_die_cut_mould" do
    assert_difference('SelectionDieCutMould.count', -1) do
      delete :destroy, id: @selection_die_cut_mould
    end

    assert_redirected_to selection_die_cut_moulds_path
  end
end
