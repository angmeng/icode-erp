require 'test_helper'

class ReceiptStatementLinesControllerTest < ActionController::TestCase
  setup do
    @receipt_statement_line = receipt_statement_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipt_statement_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipt_statement_line" do
    assert_difference('ReceiptStatementLine.count') do
      post :create, receipt_statement_line: { receipt_id: @receipt_statement_line.receipt_id, statement_of_account_id: @receipt_statement_line.statement_of_account_id }
    end

    assert_redirected_to receipt_statement_line_path(assigns(:receipt_statement_line))
  end

  test "should show receipt_statement_line" do
    get :show, id: @receipt_statement_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipt_statement_line
    assert_response :success
  end

  test "should update receipt_statement_line" do
    put :update, id: @receipt_statement_line, receipt_statement_line: { receipt_id: @receipt_statement_line.receipt_id, statement_of_account_id: @receipt_statement_line.statement_of_account_id }
    assert_redirected_to receipt_statement_line_path(assigns(:receipt_statement_line))
  end

  test "should destroy receipt_statement_line" do
    assert_difference('ReceiptStatementLine.count', -1) do
      delete :destroy, id: @receipt_statement_line
    end

    assert_redirected_to receipt_statement_lines_path
  end
end
