require 'test_helper'

class ChangeCompanyCodesControllerTest < ActionController::TestCase
  setup do
    @change_company_code = change_company_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:change_company_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create change_company_code" do
    assert_difference('ChangeCompanyCode.count') do
      post :create, change_company_code: { new_code: @change_company_code.new_code, old_code: @change_company_code.old_code, remark: @change_company_code.remark, trade_company_id: @change_company_code.trade_company_id }
    end

    assert_redirected_to change_company_code_path(assigns(:change_company_code))
  end

  test "should show change_company_code" do
    get :show, id: @change_company_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @change_company_code
    assert_response :success
  end

  test "should update change_company_code" do
    put :update, id: @change_company_code, change_company_code: { new_code: @change_company_code.new_code, old_code: @change_company_code.old_code, remark: @change_company_code.remark, trade_company_id: @change_company_code.trade_company_id }
    assert_redirected_to change_company_code_path(assigns(:change_company_code))
  end

  test "should destroy change_company_code" do
    assert_difference('ChangeCompanyCode.count', -1) do
      delete :destroy, id: @change_company_code
    end

    assert_redirected_to change_company_codes_path
  end
end
