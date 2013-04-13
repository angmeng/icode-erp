require 'test_helper'

class JournalVouchersControllerTest < ActionController::TestCase
  setup do
    @journal_voucher = journal_vouchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_vouchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_voucher" do
    assert_difference('JournalVoucher.count') do
      post :create, journal_voucher: { credit_amount: @journal_voucher.credit_amount, debit_amount: @journal_voucher.debit_amount, jv_date: @journal_voucher.jv_date, jv_no: @journal_voucher.jv_no, particular: @journal_voucher.particular, trade_company_id: @journal_voucher.trade_company_id, updated_by: @journal_voucher.updated_by }
    end

    assert_redirected_to journal_voucher_path(assigns(:journal_voucher))
  end

  test "should show journal_voucher" do
    get :show, id: @journal_voucher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_voucher
    assert_response :success
  end

  test "should update journal_voucher" do
    put :update, id: @journal_voucher, journal_voucher: { credit_amount: @journal_voucher.credit_amount, debit_amount: @journal_voucher.debit_amount, jv_date: @journal_voucher.jv_date, jv_no: @journal_voucher.jv_no, particular: @journal_voucher.particular, trade_company_id: @journal_voucher.trade_company_id, updated_by: @journal_voucher.updated_by }
    assert_redirected_to journal_voucher_path(assigns(:journal_voucher))
  end

  test "should destroy journal_voucher" do
    assert_difference('JournalVoucher.count', -1) do
      delete :destroy, id: @journal_voucher
    end

    assert_redirected_to journal_vouchers_path
  end
end
