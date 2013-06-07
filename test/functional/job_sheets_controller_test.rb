require 'test_helper'

class JobSheetsControllerTest < ActionController::TestCase
  setup do
    @job_sheet = job_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_sheet" do
    assert_difference('JobSheet.count') do
      post :create, job_sheet: { customer_name: @job_sheet.customer_name, description: @job_sheet.description, qrf_date: @job_sheet.qrf_date }
    end

    assert_redirected_to job_sheet_path(assigns(:job_sheet))
  end

  test "should show job_sheet" do
    get :show, id: @job_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_sheet
    assert_response :success
  end

  test "should update job_sheet" do
    put :update, id: @job_sheet, job_sheet: { customer_name: @job_sheet.customer_name, description: @job_sheet.description, qrf_date: @job_sheet.qrf_date }
    assert_redirected_to job_sheet_path(assigns(:job_sheet))
  end

  test "should destroy job_sheet" do
    assert_difference('JobSheet.count', -1) do
      delete :destroy, id: @job_sheet
    end

    assert_redirected_to job_sheets_path
  end
end
