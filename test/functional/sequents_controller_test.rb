require 'test_helper'

class SequentsControllerTest < ActionController::TestCase
  setup do
    @sequent = sequents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequent" do
    assert_difference('Sequent.count') do
      post :create, sequent: { quotation_request_form_id: @sequent.quotation_request_form_id, sequent_color: @sequent.sequent_color }
    end

    assert_redirected_to sequent_path(assigns(:sequent))
  end

  test "should show sequent" do
    get :show, id: @sequent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequent
    assert_response :success
  end

  test "should update sequent" do
    put :update, id: @sequent, sequent: { quotation_request_form_id: @sequent.quotation_request_form_id, sequent_color: @sequent.sequent_color }
    assert_redirected_to sequent_path(assigns(:sequent))
  end

  test "should destroy sequent" do
    assert_difference('Sequent.count', -1) do
      delete :destroy, id: @sequent
    end

    assert_redirected_to sequents_path
  end
end
