require 'test_helper'

class SelectionFieldsetsControllerTest < ActionController::TestCase
  setup do
    @selection_fieldset = selection_fieldsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_fieldsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_fieldset" do
    assert_difference('SelectionFieldset.count') do
      post :create, selection_fieldset: { quotation_request_form_id: @selection_fieldset.quotation_request_form_id, select_no: @selection_fieldset.select_no }
    end

    assert_redirected_to selection_fieldset_path(assigns(:selection_fieldset))
  end

  test "should show selection_fieldset" do
    get :show, id: @selection_fieldset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_fieldset
    assert_response :success
  end

  test "should update selection_fieldset" do
    put :update, id: @selection_fieldset, selection_fieldset: { quotation_request_form_id: @selection_fieldset.quotation_request_form_id, select_no: @selection_fieldset.select_no }
    assert_redirected_to selection_fieldset_path(assigns(:selection_fieldset))
  end

  test "should destroy selection_fieldset" do
    assert_difference('SelectionFieldset.count', -1) do
      delete :destroy, id: @selection_fieldset
    end

    assert_redirected_to selection_fieldsets_path
  end
end
