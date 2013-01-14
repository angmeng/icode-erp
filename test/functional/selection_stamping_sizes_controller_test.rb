require 'test_helper'

class SelectionStampingSizesControllerTest < ActionController::TestCase
  setup do
    @selection_stamping_size = selection_stamping_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_stamping_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_stamping_size" do
    assert_difference('SelectionStampingSize.count') do
      post :create, selection_stamping_size: { quoation_request_form_id: @selection_stamping_size.quoation_request_form_id, stamping_length: @selection_stamping_size.stamping_length, stamping_width: @selection_stamping_size.stamping_width }
    end

    assert_redirected_to selection_stamping_size_path(assigns(:selection_stamping_size))
  end

  test "should show selection_stamping_size" do
    get :show, id: @selection_stamping_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_stamping_size
    assert_response :success
  end

  test "should update selection_stamping_size" do
    put :update, id: @selection_stamping_size, selection_stamping_size: { quoation_request_form_id: @selection_stamping_size.quoation_request_form_id, stamping_length: @selection_stamping_size.stamping_length, stamping_width: @selection_stamping_size.stamping_width }
    assert_redirected_to selection_stamping_size_path(assigns(:selection_stamping_size))
  end

  test "should destroy selection_stamping_size" do
    assert_difference('SelectionStampingSize.count', -1) do
      delete :destroy, id: @selection_stamping_size
    end

    assert_redirected_to selection_stamping_sizes_path
  end
end
