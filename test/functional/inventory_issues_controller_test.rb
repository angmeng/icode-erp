require 'test_helper'

class InventoryIssuesControllerTest < ActionController::TestCase
  setup do
    @inventory_issue = inventory_issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_issue" do
    assert_difference('InventoryIssue.count') do
      post :create, inventory_issue: { description: @inventory_issue.description, in_out: @inventory_issue.in_out }
    end

    assert_redirected_to inventory_issue_path(assigns(:inventory_issue))
  end

  test "should show inventory_issue" do
    get :show, id: @inventory_issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_issue
    assert_response :success
  end

  test "should update inventory_issue" do
    put :update, id: @inventory_issue, inventory_issue: { description: @inventory_issue.description, in_out: @inventory_issue.in_out }
    assert_redirected_to inventory_issue_path(assigns(:inventory_issue))
  end

  test "should destroy inventory_issue" do
    assert_difference('InventoryIssue.count', -1) do
      delete :destroy, id: @inventory_issue
    end

    assert_redirected_to inventory_issues_path
  end
end
