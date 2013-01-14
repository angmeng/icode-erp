require 'test_helper'

class CostingSheetChangelogsControllerTest < ActionController::TestCase
  setup do
    @costing_sheet_changelog = costing_sheet_changelogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costing_sheet_changelogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costing_sheet_changelog" do
    assert_difference('CostingSheetChangelog.count') do
      post :create, costing_sheet_changelog: { change_log: @costing_sheet_changelog.change_log, costing_sheet_id: @costing_sheet_changelog.costing_sheet_id }
    end

    assert_redirected_to costing_sheet_changelog_path(assigns(:costing_sheet_changelog))
  end

  test "should show costing_sheet_changelog" do
    get :show, id: @costing_sheet_changelog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costing_sheet_changelog
    assert_response :success
  end

  test "should update costing_sheet_changelog" do
    put :update, id: @costing_sheet_changelog, costing_sheet_changelog: { change_log: @costing_sheet_changelog.change_log, costing_sheet_id: @costing_sheet_changelog.costing_sheet_id }
    assert_redirected_to costing_sheet_changelog_path(assigns(:costing_sheet_changelog))
  end

  test "should destroy costing_sheet_changelog" do
    assert_difference('CostingSheetChangelog.count', -1) do
      delete :destroy, id: @costing_sheet_changelog
    end

    assert_redirected_to costing_sheet_changelogs_path
  end
end
