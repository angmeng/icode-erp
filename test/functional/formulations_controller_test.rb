require 'test_helper'

class FormulationsControllerTest < ActionController::TestCase
  setup do
    @formulation = formulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulation" do
    assert_difference('Formulation.count') do
      post :create, formulation: { convert_value: @formulation.convert_value, from_unit_measurement_id: @formulation.from_unit_measurement_id, per_value: @formulation.per_value, to_unit_measurement_id: @formulation.to_unit_measurement_id }
    end

    assert_redirected_to formulation_path(assigns(:formulation))
  end

  test "should show formulation" do
    get :show, id: @formulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulation
    assert_response :success
  end

  test "should update formulation" do
    put :update, id: @formulation, formulation: { convert_value: @formulation.convert_value, from_unit_measurement_id: @formulation.from_unit_measurement_id, per_value: @formulation.per_value, to_unit_measurement_id: @formulation.to_unit_measurement_id }
    assert_redirected_to formulation_path(assigns(:formulation))
  end

  test "should destroy formulation" do
    assert_difference('Formulation.count', -1) do
      delete :destroy, id: @formulation
    end

    assert_redirected_to formulations_path
  end
end
