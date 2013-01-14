require 'test_helper'

class ReceiveNotesControllerTest < ActionController::TestCase
  setup do
    @receive_note = receive_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receive_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receive_note" do
    assert_difference('ReceiveNote.count') do
      post :create, receive_note: { currency_id: @receive_note.currency_id, receive_no_date: @receive_note.receive_no_date, receive_note_no: @receive_note.receive_note_no, sale_tax_exempt: @receive_note.sale_tax_exempt, trade_company_id: @receive_note.trade_company_id, trade_term_id: @receive_note.trade_term_id, updated_by: @receive_note.updated_by, vendor_delivery_no: @receive_note.vendor_delivery_no }
    end

    assert_redirected_to receive_note_path(assigns(:receive_note))
  end

  test "should show receive_note" do
    get :show, id: @receive_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receive_note
    assert_response :success
  end

  test "should update receive_note" do
    put :update, id: @receive_note, receive_note: { currency_id: @receive_note.currency_id, receive_no_date: @receive_note.receive_no_date, receive_note_no: @receive_note.receive_note_no, sale_tax_exempt: @receive_note.sale_tax_exempt, trade_company_id: @receive_note.trade_company_id, trade_term_id: @receive_note.trade_term_id, updated_by: @receive_note.updated_by, vendor_delivery_no: @receive_note.vendor_delivery_no }
    assert_redirected_to receive_note_path(assigns(:receive_note))
  end

  test "should destroy receive_note" do
    assert_difference('ReceiveNote.count', -1) do
      delete :destroy, id: @receive_note
    end

    assert_redirected_to receive_notes_path
  end
end
