require 'test_helper'

class OutgoingRejectsControllerTest < ActionController::TestCase
  setup do
    @outgoing_reject = outgoing_rejects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_rejects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_reject" do
    assert_difference('OutgoingReject.count') do
      post :create, outgoing_reject: { currency_id: @outgoing_reject.currency_id, lampiran: @outgoing_reject.lampiran, outgoing_date: @outgoing_reject.outgoing_date, outgoing_reject: @outgoing_reject.outgoing_reject, return_note_no: @outgoing_reject.return_note_no, sales_tax: @outgoing_reject.sales_tax, trade_company_id: @outgoing_reject.trade_company_id, trade_term_id: @outgoing_reject.trade_term_id, updated_by: @outgoing_reject.updated_by }
    end

    assert_redirected_to outgoing_reject_path(assigns(:outgoing_reject))
  end

  test "should show outgoing_reject" do
    get :show, id: @outgoing_reject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outgoing_reject
    assert_response :success
  end

  test "should update outgoing_reject" do
    put :update, id: @outgoing_reject, outgoing_reject: { currency_id: @outgoing_reject.currency_id, lampiran: @outgoing_reject.lampiran, outgoing_date: @outgoing_reject.outgoing_date, outgoing_reject: @outgoing_reject.outgoing_reject, return_note_no: @outgoing_reject.return_note_no, sales_tax: @outgoing_reject.sales_tax, trade_company_id: @outgoing_reject.trade_company_id, trade_term_id: @outgoing_reject.trade_term_id, updated_by: @outgoing_reject.updated_by }
    assert_redirected_to outgoing_reject_path(assigns(:outgoing_reject))
  end

  test "should destroy outgoing_reject" do
    assert_difference('OutgoingReject.count', -1) do
      delete :destroy, id: @outgoing_reject
    end

    assert_redirected_to outgoing_rejects_path
  end
end
