require 'test_helper'

class StatementOfAccountsControllerTest < ActionController::TestCase
  setup do
    @statement_of_account = statement_of_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statement_of_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statement_of_account" do
    assert_difference('StatementOfAccount.count') do
      post :create, statement_of_account: { credit_note_id: @statement_of_account.credit_note_id, debit_note_id: @statement_of_account.debit_note_id, trade_company_id: @statement_of_account.trade_company_id, transaction_date: @statement_of_account.transaction_date, transaction_type: @statement_of_account.transaction_type }
    end

    assert_redirected_to statement_of_account_path(assigns(:statement_of_account))
  end

  test "should show statement_of_account" do
    get :show, id: @statement_of_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statement_of_account
    assert_response :success
  end

  test "should update statement_of_account" do
    put :update, id: @statement_of_account, statement_of_account: { credit_note_id: @statement_of_account.credit_note_id, debit_note_id: @statement_of_account.debit_note_id, trade_company_id: @statement_of_account.trade_company_id, transaction_date: @statement_of_account.transaction_date, transaction_type: @statement_of_account.transaction_type }
    assert_redirected_to statement_of_account_path(assigns(:statement_of_account))
  end

  test "should destroy statement_of_account" do
    assert_difference('StatementOfAccount.count', -1) do
      delete :destroy, id: @statement_of_account
    end

    assert_redirected_to statement_of_accounts_path
  end
end
