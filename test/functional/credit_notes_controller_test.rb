require 'test_helper'

class CreditNotesControllerTest < ActionController::TestCase
  setup do
    @credit_note = credit_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_note" do
    assert_difference('CreditNote.count') do
      post :create, credit_note: { account_id: @credit_note.account_id, amount: @credit_note.amount, credit_note_date: @credit_note.credit_note_date, credit_note_no: @credit_note.credit_note_no, credit_type: @credit_note.credit_type, currency_id: @credit_note.currency_id, trade_company_id: @credit_note.trade_company_id, updated_by: @credit_note.updated_by }
    end

    assert_redirected_to credit_note_path(assigns(:credit_note))
  end

  test "should show credit_note" do
    get :show, id: @credit_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_note
    assert_response :success
  end

  test "should update credit_note" do
    put :update, id: @credit_note, credit_note: { account_id: @credit_note.account_id, amount: @credit_note.amount, credit_note_date: @credit_note.credit_note_date, credit_note_no: @credit_note.credit_note_no, credit_type: @credit_note.credit_type, currency_id: @credit_note.currency_id, trade_company_id: @credit_note.trade_company_id, updated_by: @credit_note.updated_by }
    assert_redirected_to credit_note_path(assigns(:credit_note))
  end

  test "should destroy credit_note" do
    assert_difference('CreditNote.count', -1) do
      delete :destroy, id: @credit_note
    end

    assert_redirected_to credit_notes_path
  end
end
