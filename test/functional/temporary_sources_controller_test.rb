require 'test_helper'

class TemporarySourcesControllerTest < ActionController::TestCase
  setup do
    @temporary_source = temporary_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temporary_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temporary_source" do
    assert_difference('TemporarySource.count') do
      post :create, temporary_source: { company_name: @temporary_source.company_name, remark: @temporary_source.remark, select_vendor: @temporary_source.select_vendor, unit_price: @temporary_source.unit_price }
    end

    assert_redirected_to temporary_source_path(assigns(:temporary_source))
  end

  test "should show temporary_source" do
    get :show, id: @temporary_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temporary_source
    assert_response :success
  end

  test "should update temporary_source" do
    put :update, id: @temporary_source, temporary_source: { company_name: @temporary_source.company_name, remark: @temporary_source.remark, select_vendor: @temporary_source.select_vendor, unit_price: @temporary_source.unit_price }
    assert_redirected_to temporary_source_path(assigns(:temporary_source))
  end

  test "should destroy temporary_source" do
    assert_difference('TemporarySource.count', -1) do
      delete :destroy, id: @temporary_source
    end

    assert_redirected_to temporary_sources_path
  end
end
