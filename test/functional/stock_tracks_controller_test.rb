require 'test_helper'

class StockTracksControllerTest < ActionController::TestCase
  setup do
    @stock_track = stock_tracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_track" do
    assert_difference('StockTrack.count') do
      post :create, stock_track: { amount: @stock_track.amount, balance: @stock_track.balance, product_id: @stock_track.product_id, transfer_note: @stock_track.transfer_note }
    end

    assert_redirected_to stock_track_path(assigns(:stock_track))
  end

  test "should show stock_track" do
    get :show, id: @stock_track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_track
    assert_response :success
  end

  test "should update stock_track" do
    put :update, id: @stock_track, stock_track: { amount: @stock_track.amount, balance: @stock_track.balance, product_id: @stock_track.product_id, transfer_note: @stock_track.transfer_note }
    assert_redirected_to stock_track_path(assigns(:stock_track))
  end

  test "should destroy stock_track" do
    assert_difference('StockTrack.count', -1) do
      delete :destroy, id: @stock_track
    end

    assert_redirected_to stock_tracks_path
  end
end
