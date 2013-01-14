require 'test_helper'

class SelectionPrintingSizesControllerTest < ActionController::TestCase
  setup do
    @selection_printing_size = selection_printing_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_printing_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_printing_size" do
    assert_difference('SelectionPrintingSize.count') do
      post :create, selection_printing_size: { length: @selection_printing_size.length, quotation_request_form_id: @selection_printing_size.quotation_request_form_id, ups: @selection_printing_size.ups, width: @selection_printing_size.width }
    end

    assert_redirected_to selection_printing_size_path(assigns(:selection_printing_size))
  end

  test "should show selection_printing_size" do
    get :show, id: @selection_printing_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_printing_size
    assert_response :success
  end

  test "should update selection_printing_size" do
    put :update, id: @selection_printing_size, selection_printing_size: { length: @selection_printing_size.length, quotation_request_form_id: @selection_printing_size.quotation_request_form_id, ups: @selection_printing_size.ups, width: @selection_printing_size.width }
    assert_redirected_to selection_printing_size_path(assigns(:selection_printing_size))
  end

  test "should destroy selection_printing_size" do
    assert_difference('SelectionPrintingSize.count', -1) do
      delete :destroy, id: @selection_printing_size
    end

    assert_redirected_to selection_printing_sizes_path
  end
end
