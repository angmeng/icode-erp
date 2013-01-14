require 'test_helper'

class SelectionVarnishTypesControllerTest < ActionController::TestCase
  setup do
    @selection_varnish_type = selection_varnish_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_varnish_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_varnish_type" do
    assert_difference('SelectionVarnishType.count') do
      post :create, selection_varnish_type: { quotation_request_form_id: @selection_varnish_type.quotation_request_form_id, varnish_type: @selection_varnish_type.varnish_type }
    end

    assert_redirected_to selection_varnish_type_path(assigns(:selection_varnish_type))
  end

  test "should show selection_varnish_type" do
    get :show, id: @selection_varnish_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_varnish_type
    assert_response :success
  end

  test "should update selection_varnish_type" do
    put :update, id: @selection_varnish_type, selection_varnish_type: { quotation_request_form_id: @selection_varnish_type.quotation_request_form_id, varnish_type: @selection_varnish_type.varnish_type }
    assert_redirected_to selection_varnish_type_path(assigns(:selection_varnish_type))
  end

  test "should destroy selection_varnish_type" do
    assert_difference('SelectionVarnishType.count', -1) do
      delete :destroy, id: @selection_varnish_type
    end

    assert_redirected_to selection_varnish_types_path
  end
end
