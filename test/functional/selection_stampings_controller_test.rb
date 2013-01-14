require 'test_helper'

class SelectionStampingsControllerTest < ActionController::TestCase
  setup do
    @selection_stamping = selection_stampings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selection_stampings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selection_stamping" do
    assert_difference('SelectionStamping.count') do
      post :create, selection_stamping: { stamping_other: @selection_stamping.stamping_other, stamping_type: @selection_stamping.stamping_type }
    end

    assert_redirected_to selection_stamping_path(assigns(:selection_stamping))
  end

  test "should show selection_stamping" do
    get :show, id: @selection_stamping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selection_stamping
    assert_response :success
  end

  test "should update selection_stamping" do
    put :update, id: @selection_stamping, selection_stamping: { stamping_other: @selection_stamping.stamping_other, stamping_type: @selection_stamping.stamping_type }
    assert_redirected_to selection_stamping_path(assigns(:selection_stamping))
  end

  test "should destroy selection_stamping" do
    assert_difference('SelectionStamping.count', -1) do
      delete :destroy, id: @selection_stamping
    end

    assert_redirected_to selection_stampings_path
  end
end
