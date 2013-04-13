require 'test_helper'

class JournalVoucherItemsControllerTest < ActionController::TestCase
  setup do
    @journal_voucher_item = journal_voucher_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_voucher_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_voucher_item" do
    assert_difference('JournalVoucherItem.count') do
      post :create, journal_voucher_item: { balance_amount: @journal_voucher_item.balance_amount, document_amount: @journal_voucher_item.document_amount, document_date: @journal_voucher_item.document_date, document_no: @journal_voucher_item.document_no, document_type: @journal_voucher_item.document_type, fp: @journal_voucher_item.fp, os_amount: @journal_voucher_item.os_amount }
    end

    assert_redirected_to journal_voucher_item_path(assigns(:journal_voucher_item))
  end

  test "should show journal_voucher_item" do
    get :show, id: @journal_voucher_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_voucher_item
    assert_response :success
  end

  test "should update journal_voucher_item" do
    put :update, id: @journal_voucher_item, journal_voucher_item: { balance_amount: @journal_voucher_item.balance_amount, document_amount: @journal_voucher_item.document_amount, document_date: @journal_voucher_item.document_date, document_no: @journal_voucher_item.document_no, document_type: @journal_voucher_item.document_type, fp: @journal_voucher_item.fp, os_amount: @journal_voucher_item.os_amount }
    assert_redirected_to journal_voucher_item_path(assigns(:journal_voucher_item))
  end

  test "should destroy journal_voucher_item" do
    assert_difference('JournalVoucherItem.count', -1) do
      delete :destroy, id: @journal_voucher_item
    end

    assert_redirected_to journal_voucher_items_path
  end
end
