require 'test_helper'

class QuotationRequestFormsControllerTest < ActionController::TestCase
  setup do
    @quotation_request_form = quotation_request_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotation_request_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotation_request_form" do
    assert_difference('QuotationRequestForm.count') do
      post :create, quotation_request_form: { color: @quotation_request_form.color, customer_name: @quotation_request_form.customer_name, description: @quotation_request_form.description, dimensen_height: @quotation_request_form.dimensen_height, dimensen_length: @quotation_request_form.dimensen_length, dimensen_width: @quotation_request_form.dimensen_width, finishing: @quotation_request_form.finishing, material: @quotation_request_form.material, open_size_length: @quotation_request_form.open_size_length, open_size_width: @quotation_request_form.open_size_width, qrf_date: @quotation_request_form.qrf_date, quantity: @quotation_request_form.quantity, remark: @quotation_request_form.remark, unit_price: @quotation_request_form.unit_price }
    end

    assert_redirected_to quotation_request_form_path(assigns(:quotation_request_form))
  end

  test "should show quotation_request_form" do
    get :show, id: @quotation_request_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotation_request_form
    assert_response :success
  end

  test "should update quotation_request_form" do
    put :update, id: @quotation_request_form, quotation_request_form: { color: @quotation_request_form.color, customer_name: @quotation_request_form.customer_name, description: @quotation_request_form.description, dimensen_height: @quotation_request_form.dimensen_height, dimensen_length: @quotation_request_form.dimensen_length, dimensen_width: @quotation_request_form.dimensen_width, finishing: @quotation_request_form.finishing, material: @quotation_request_form.material, open_size_length: @quotation_request_form.open_size_length, open_size_width: @quotation_request_form.open_size_width, qrf_date: @quotation_request_form.qrf_date, quantity: @quotation_request_form.quantity, remark: @quotation_request_form.remark, unit_price: @quotation_request_form.unit_price }
    assert_redirected_to quotation_request_form_path(assigns(:quotation_request_form))
  end

  test "should destroy quotation_request_form" do
    assert_difference('QuotationRequestForm.count', -1) do
      delete :destroy, id: @quotation_request_form
    end

    assert_redirected_to quotation_request_forms_path
  end
end
