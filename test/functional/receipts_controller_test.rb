require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase
  setup do
    @receipt = receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt" do
    assert_difference('Receipt.count') do
      post :create, receipt: { cash_amount: @receipt.cash_amount, cheque_amount: @receipt.cheque_amount, journal_voucher_no: @receipt.journal_voucher_no, receipt_date: @receipt.receipt_date, receipt_no: @receipt.receipt_no, remark: @receipt.remark, total_amount: @receipt.total_amount, trade_company_id: @receipt.trade_company_id, user_id: @receipt.user_id }
    end

    assert_redirected_to receipt_path(assigns(:receipt))
  end

  test "should show receipt" do
    get :show, id: @receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt
    assert_response :success
  end

  test "should update receipt" do
    put :update, id: @receipt, receipt: { cash_amount: @receipt.cash_amount, cheque_amount: @receipt.cheque_amount, journal_voucher_no: @receipt.journal_voucher_no, receipt_date: @receipt.receipt_date, receipt_no: @receipt.receipt_no, remark: @receipt.remark, total_amount: @receipt.total_amount, trade_company_id: @receipt.trade_company_id, user_id: @receipt.user_id }
    assert_redirected_to receipt_path(assigns(:receipt))
  end

  test "should destroy receipt" do
    assert_difference('Receipt.count', -1) do
      delete :destroy, id: @receipt
    end

    assert_redirected_to receipts_path
  end
end
