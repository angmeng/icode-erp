require 'test_helper'

class SalesTaxExemptionItemsControllerTest < ActionController::TestCase
  setup do
    @sales_tax_exemption_item = sales_tax_exemption_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_tax_exemption_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax_exemption_item" do
    assert_difference('SalesTaxExemptionItem.count') do
      post :create, sales_tax_exemption_item: { product_id: @sales_tax_exemption_item.product_id, remaining_total: @sales_tax_exemption_item.remaining_total, sales_tax_exemption_id: @sales_tax_exemption_item.sales_tax_exemption_id }
    end

    assert_redirected_to sales_tax_exemption_item_path(assigns(:sales_tax_exemption_item))
  end

  test "should show sales_tax_exemption_item" do
    get :show, id: @sales_tax_exemption_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax_exemption_item
    assert_response :success
  end

  test "should update sales_tax_exemption_item" do
    put :update, id: @sales_tax_exemption_item, sales_tax_exemption_item: { product_id: @sales_tax_exemption_item.product_id, remaining_total: @sales_tax_exemption_item.remaining_total, sales_tax_exemption_id: @sales_tax_exemption_item.sales_tax_exemption_id }
    assert_redirected_to sales_tax_exemption_item_path(assigns(:sales_tax_exemption_item))
  end

  test "should destroy sales_tax_exemption_item" do
    assert_difference('SalesTaxExemptionItem.count', -1) do
      delete :destroy, id: @sales_tax_exemption_item
    end

    assert_redirected_to sales_tax_exemption_items_path
  end
end
