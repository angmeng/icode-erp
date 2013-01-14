require 'test_helper'

class TemporaryTarifCodesControllerTest < ActionController::TestCase
  setup do
    @temporary_tarif_code = temporary_tarif_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temporary_tarif_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temporary_tarif_code" do
    assert_difference('TemporaryTarifCode.count') do
      post :create, temporary_tarif_code: { remaining_total: @temporary_tarif_code.remaining_total, tarif_code: @temporary_tarif_code.tarif_code }
    end

    assert_redirected_to temporary_tarif_code_path(assigns(:temporary_tarif_code))
  end

  test "should show temporary_tarif_code" do
    get :show, id: @temporary_tarif_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temporary_tarif_code
    assert_response :success
  end

  test "should update temporary_tarif_code" do
    put :update, id: @temporary_tarif_code, temporary_tarif_code: { remaining_total: @temporary_tarif_code.remaining_total, tarif_code: @temporary_tarif_code.tarif_code }
    assert_redirected_to temporary_tarif_code_path(assigns(:temporary_tarif_code))
  end

  test "should destroy temporary_tarif_code" do
    assert_difference('TemporaryTarifCode.count', -1) do
      delete :destroy, id: @temporary_tarif_code
    end

    assert_redirected_to temporary_tarif_codes_path
  end
end
