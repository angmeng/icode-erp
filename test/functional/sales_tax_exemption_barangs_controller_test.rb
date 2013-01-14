require 'test_helper'

class SalesTaxExemptionBarangsControllerTest < ActionController::TestCase
  setup do
    @sales_tax_exemption_barang = sales_tax_exemption_barangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_tax_exemption_barangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_tax_exemption_barang" do
    assert_difference('SalesTaxExemptionBarang.count') do
      post :create, sales_tax_exemption_barang: { apply_qty: @sales_tax_exemption_barang.apply_qty, complete_qty: @sales_tax_exemption_barang.complete_qty, perihal_barang: @sales_tax_exemption_barang.perihal_barang, sales_tax_exemption_id: @sales_tax_exemption_barang.sales_tax_exemption_id, tarif_code: @sales_tax_exemption_barang.tarif_code, unit_measurement_id: @sales_tax_exemption_barang.unit_measurement_id, valid_condition: @sales_tax_exemption_barang.valid_condition }
    end

    assert_redirected_to sales_tax_exemption_barang_path(assigns(:sales_tax_exemption_barang))
  end

  test "should show sales_tax_exemption_barang" do
    get :show, id: @sales_tax_exemption_barang
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_tax_exemption_barang
    assert_response :success
  end

  test "should update sales_tax_exemption_barang" do
    put :update, id: @sales_tax_exemption_barang, sales_tax_exemption_barang: { apply_qty: @sales_tax_exemption_barang.apply_qty, complete_qty: @sales_tax_exemption_barang.complete_qty, perihal_barang: @sales_tax_exemption_barang.perihal_barang, sales_tax_exemption_id: @sales_tax_exemption_barang.sales_tax_exemption_id, tarif_code: @sales_tax_exemption_barang.tarif_code, unit_measurement_id: @sales_tax_exemption_barang.unit_measurement_id, valid_condition: @sales_tax_exemption_barang.valid_condition }
    assert_redirected_to sales_tax_exemption_barang_path(assigns(:sales_tax_exemption_barang))
  end

  test "should destroy sales_tax_exemption_barang" do
    assert_difference('SalesTaxExemptionBarang.count', -1) do
      delete :destroy, id: @sales_tax_exemption_barang
    end

    assert_redirected_to sales_tax_exemption_barangs_path
  end
end
