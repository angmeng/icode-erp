require 'test_helper'

class StockOutsControllerTest < ActionController::TestCase
  setup do
    @stock_out = stock_outs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_outs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_out" do
    assert_difference('StockOut.count') do
      post :create, stock_out: { amount: @stock_out.amount, balance: @stock_out.balance, product_id: @stock_out.product_id, transfer_note: @stock_out.transfer_note }
    end

    assert_redirected_to stock_out_path(assigns(:stock_out))
  end

  test "should show stock_out" do
    get :show, id: @stock_out
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_out
    assert_response :success
  end

  test "should update stock_out" do
    put :update, id: @stock_out, stock_out: { amount: @stock_out.amount, balance: @stock_out.balance, product_id: @stock_out.product_id, transfer_note: @stock_out.transfer_note }
    assert_redirected_to stock_out_path(assigns(:stock_out))
  end

  test "should destroy stock_out" do
    assert_difference('StockOut.count', -1) do
      delete :destroy, id: @stock_out
    end

    assert_redirected_to stock_outs_path
  end
end
