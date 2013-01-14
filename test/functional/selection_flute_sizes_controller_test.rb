require 'test_helper'

class SelectionFluteSizesControllerTest < ActionController::TestCase
  setup do
    @selection_flute_size = selection_flute_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_flute_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_flute_size" do
    assert_difference('SelectionFluteSize.count') do
      post :create, selection_flute_size: { flute_length: @selection_flute_size.flute_length, flute_width: @selection_flute_size.flute_width, quotation_request_form_id: @selection_flute_size.quotation_request_form_id }
    end

    assert_redirected_to selection_flute_size_path(assigns(:selection_flute_size))
  end

  test "should show selection_flute_size" do
    get :show, id: @selection_flute_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_flute_size
    assert_response :success
  end

  test "should update selection_flute_size" do
    put :update, id: @selection_flute_size, selection_flute_size: { flute_length: @selection_flute_size.flute_length, flute_width: @selection_flute_size.flute_width, quotation_request_form_id: @selection_flute_size.quotation_request_form_id }
    assert_redirected_to selection_flute_size_path(assigns(:selection_flute_size))
  end

  test "should destroy selection_flute_size" do
    assert_difference('SelectionFluteSize.count', -1) do
      delete :destroy, id: @selection_flute_size
    end

    assert_redirected_to selection_flute_sizes_path
  end
end
