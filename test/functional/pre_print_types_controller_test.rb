require 'test_helper'

class PrePrintTypesControllerTest < ActionController::TestCase
  setup do
    @pre_print_type = pre_print_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_print_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_print_type" do
    assert_difference('PrePrintType.count') do
      post :create, pre_print_type: { pre_print: @pre_print_type.pre_print, quotation_request_form_id: @pre_print_type.quotation_request_form_id }
    end

    assert_redirected_to pre_print_type_path(assigns(:pre_print_type))
  end

  test "should show pre_print_type" do
    get :show, id: @pre_print_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_print_type
    assert_response :success
  end

  test "should update pre_print_type" do
    put :update, id: @pre_print_type, pre_print_type: { pre_print: @pre_print_type.pre_print, quotation_request_form_id: @pre_print_type.quotation_request_form_id }
    assert_redirected_to pre_print_type_path(assigns(:pre_print_type))
  end

  test "should destroy pre_print_type" do
    assert_difference('PrePrintType.count', -1) do
      delete :destroy, id: @pre_print_type
    end

    assert_redirected_to pre_print_types_path
  end
end
