require 'test_helper'

class DebitNotesControllerTest < ActionController::TestCase
  setup do
    @debit_note = debit_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debit_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debit_note" do
    assert_difference('DebitNote.count') do
      post :create, debit_note: { account_id: @debit_note.account_id, currency_id: @debit_note.currency_id, debit_note_date: @debit_note.debit_note_date, debit_note_no: @debit_note.debit_note_no, debit_type: @debit_note.debit_type, status_id: @debit_note.status_id, trade_company_id: @debit_note.trade_company_id, updated_by: @debit_note.updated_by }
    end

    assert_redirected_to debit_note_path(assigns(:debit_note))
  end

  test "should show debit_note" do
    get :show, id: @debit_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debit_note
    assert_response :success
  end

  test "should update debit_note" do
    put :update, id: @debit_note, debit_note: { account_id: @debit_note.account_id, currency_id: @debit_note.currency_id, debit_note_date: @debit_note.debit_note_date, debit_note_no: @debit_note.debit_note_no, debit_type: @debit_note.debit_type, status_id: @debit_note.status_id, trade_company_id: @debit_note.trade_company_id, updated_by: @debit_note.updated_by }
    assert_redirected_to debit_note_path(assigns(:debit_note))
  end

  test "should destroy debit_note" do
    assert_difference('DebitNote.count', -1) do
      delete :destroy, id: @debit_note
    end

    assert_redirected_to debit_notes_path
  end
end
