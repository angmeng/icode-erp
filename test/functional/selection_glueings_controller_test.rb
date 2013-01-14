require 'test_helper'

class SelectionGlueingsControllerTest < ActionController::TestCase
  setup do
    @selection_glueing = selection_glueings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_glueings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_glueing" do
    assert_difference('SelectionGlueing.count') do
      post :create, selection_glueing: { glueing: @selection_glueing.glueing, quotation_request_form_id: @selection_glueing.quotation_request_form_id }
    end

    assert_redirected_to selection_glueing_path(assigns(:selection_glueing))
  end

  test "should show selection_glueing" do
    get :show, id: @selection_glueing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_glueing
    assert_response :success
  end

  test "should update selection_glueing" do
    put :update, id: @selection_glueing, selection_glueing: { glueing: @selection_glueing.glueing, quotation_request_form_id: @selection_glueing.quotation_request_form_id }
    assert_redirected_to selection_glueing_path(assigns(:selection_glueing))
  end

  test "should destroy selection_glueing" do
    assert_difference('SelectionGlueing.count', -1) do
      delete :destroy, id: @selection_glueing
    end

    assert_redirected_to selection_glueings_path
  end
end
