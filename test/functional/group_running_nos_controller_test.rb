require 'test_helper'

class GroupRunningNosControllerTest < ActionController::TestCase
  setup do
    @group_running_no = group_running_nos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_running_nos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_running_no" do
    assert_difference('GroupRunningNo.count') do
      post :create, group_running_no: { code: @group_running_no.code, current_no: @group_running_no.current_no }
    end

    assert_redirected_to group_running_no_path(assigns(:group_running_no))
  end

  test "should show group_running_no" do
    get :show, id: @group_running_no
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_running_no
    assert_response :success
  end

  test "should update group_running_no" do
    put :update, id: @group_running_no, group_running_no: { code: @group_running_no.code, current_no: @group_running_no.current_no }
    assert_redirected_to group_running_no_path(assigns(:group_running_no))
  end

  test "should destroy group_running_no" do
    assert_difference('GroupRunningNo.count', -1) do
      delete :destroy, id: @group_running_no
    end

    assert_redirected_to group_running_nos_path
  end
end
