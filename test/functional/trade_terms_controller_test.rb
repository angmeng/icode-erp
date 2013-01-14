require 'test_helper'

class TradeTermsControllerTest < ActionController::TestCase
  setup do
    @trade_term = trade_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trade_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trade_term" do
    assert_difference('TradeTerm.count') do
      post :create, trade_term: { description: @trade_term.description, name: @trade_term.name }
    end

    assert_redirected_to trade_term_path(assigns(:trade_term))
  end

  test "should show trade_term" do
    get :show, id: @trade_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade_term
    assert_response :success
  end

  test "should update trade_term" do
    put :update, id: @trade_term, trade_term: { description: @trade_term.description, name: @trade_term.name }
    assert_redirected_to trade_term_path(assigns(:trade_term))
  end

  test "should destroy trade_term" do
    assert_difference('TradeTerm.count', -1) do
      delete :destroy, id: @trade_term
    end

    assert_redirected_to trade_terms_path
  end
end
