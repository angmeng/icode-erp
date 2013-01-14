require 'test_helper'

class DeliveryOrdersControllerTest < ActionController::TestCase
  setup do
    @delivery_order = delivery_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_order" do
    assert_difference('DeliveryOrder.count') do
      post :create, delivery_order: { bk_two: @delivery_order.bk_two, currency_id: @delivery_order.currency_id, do_no: @delivery_order.do_no, sales_rep: @delivery_order.sales_rep, sales_tax: @delivery_order.sales_tax, sales_tax_exemption: @delivery_order.sales_tax_exemption, tport_c: @delivery_order.tport_c, trade_company_id: @delivery_order.trade_company_id, trade_term_id: @delivery_order.trade_term_id, transport_id: @delivery_order.transport_id, type_of_sales_id: @delivery_order.type_of_sales_id, updated_by: @delivery_order.updated_by }
    end

    assert_redirected_to delivery_order_path(assigns(:delivery_order))
  end

  test "should show delivery_order" do
    get :show, id: @delivery_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_order
    assert_response :success
  end

  test "should update delivery_order" do
    put :update, id: @delivery_order, delivery_order: { bk_two: @delivery_order.bk_two, currency_id: @delivery_order.currency_id, do_no: @delivery_order.do_no, sales_rep: @delivery_order.sales_rep, sales_tax: @delivery_order.sales_tax, sales_tax_exemption: @delivery_order.sales_tax_exemption, tport_c: @delivery_order.tport_c, trade_company_id: @delivery_order.trade_company_id, trade_term_id: @delivery_order.trade_term_id, transport_id: @delivery_order.transport_id, type_of_sales_id: @delivery_order.type_of_sales_id, updated_by: @delivery_order.updated_by }
    assert_redirected_to delivery_order_path(assigns(:delivery_order))
  end

  test "should destroy delivery_order" do
    assert_difference('DeliveryOrder.count', -1) do
      delete :destroy, id: @delivery_order
    end

    assert_redirected_to delivery_orders_path
  end
end
