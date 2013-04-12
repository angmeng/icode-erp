require 'test_helper'

class HistoryInvoicesControllerTest < ActionController::TestCase
  setup do
    @history_invoice = history_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:history_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create history_invoice" do
    assert_difference('HistoryInvoice.count') do
      post :create, history_invoice: { delivery_order_id: @history_invoice.delivery_order_id }
    end

    assert_redirected_to history_invoice_path(assigns(:history_invoice))
  end

  test "should show history_invoice" do
    get :show, id: @history_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @history_invoice
    assert_response :success
  end

  test "should update history_invoice" do
    put :update, id: @history_invoice, history_invoice: { delivery_order_id: @history_invoice.delivery_order_id }
    assert_redirected_to history_invoice_path(assigns(:history_invoice))
  end

  test "should destroy history_invoice" do
    assert_difference('HistoryInvoice.count', -1) do
      delete :destroy, id: @history_invoice
    end

    assert_redirected_to history_invoices_path
  end
end
