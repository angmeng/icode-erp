require 'test_helper'

class SelectionDieCutsControllerTest < ActionController::TestCase
  setup do
    @selection_die_cut = selection_die_cuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_die_cuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_die_cut" do
    assert_difference('SelectionDieCut.count') do
      post :create, selection_die_cut: { content: @selection_die_cut.content, quotation_request_form_id: @selection_die_cut.quotation_request_form_id }
    end

    assert_redirected_to selection_die_cut_path(assigns(:selection_die_cut))
  end

  test "should show selection_die_cut" do
    get :show, id: @selection_die_cut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_die_cut
    assert_response :success
  end

  test "should update selection_die_cut" do
    put :update, id: @selection_die_cut, selection_die_cut: { content: @selection_die_cut.content, quotation_request_form_id: @selection_die_cut.quotation_request_form_id }
    assert_redirected_to selection_die_cut_path(assigns(:selection_die_cut))
  end

  test "should destroy selection_die_cut" do
    assert_difference('SelectionDieCut.count', -1) do
      delete :destroy, id: @selection_die_cut
    end

    assert_redirected_to selection_die_cuts_path
  end
end
