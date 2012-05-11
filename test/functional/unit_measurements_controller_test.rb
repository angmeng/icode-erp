require 'test_helper'

class UnitMeasurementsControllerTest < ActionController::TestCase
  setup do
    @unit_measurement = unit_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit_measurement" do
    assert_difference('UnitMeasurement.count') do
      post :create, unit_measurement: { code: @unit_measurement.code, desc: @unit_measurement.desc }
    end

    assert_redirected_to unit_measurement_path(assigns(:unit_measurement))
  end

  test "should show unit_measurement" do
    get :show, id: @unit_measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit_measurement
    assert_response :success
  end

  test "should update unit_measurement" do
    put :update, id: @unit_measurement, unit_measurement: { code: @unit_measurement.code, desc: @unit_measurement.desc }
    assert_redirected_to unit_measurement_path(assigns(:unit_measurement))
  end

  test "should destroy unit_measurement" do
    assert_difference('UnitMeasurement.count', -1) do
      delete :destroy, id: @unit_measurement
    end

    assert_redirected_to unit_measurements_path
  end
end
