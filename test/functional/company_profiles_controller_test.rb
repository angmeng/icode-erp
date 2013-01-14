require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
  setup do
    @company_profile = company_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_profile" do
    assert_difference('CompanyProfile.count') do
      post :create, company_profile: { address: @company_profile.address, fax_no: @company_profile.fax_no, name: @company_profile.name, reg_no: @company_profile.reg_no, sales_tax_no: @company_profile.sales_tax_no, sn_bankin_slip_no: @company_profile.sn_bankin_slip_no, sn_billing_order_no: @company_profile.sn_billing_order_no, sn_credit_note_no: @company_profile.sn_credit_note_no, sn_debit_note_no: @company_profile.sn_debit_note_no, sn_deliver_order_no: @company_profile.sn_deliver_order_no, sn_incoming_reject_no: @company_profile.sn_incoming_reject_no, sn_job_order_no: @company_profile.sn_job_order_no, sn_journal_voucher_no: @company_profile.sn_journal_voucher_no, sn_outgoing_reject_no: @company_profile.sn_outgoing_reject_no, sn_payment_voucher_no: @company_profile.sn_payment_voucher_no, sn_product_price_no: @company_profile.sn_product_price_no, sn_purchase_order_no: @company_profile.sn_purchase_order_no, sn_purchase_req_no: @company_profile.sn_purchase_req_no, sn_receipt_no: @company_profile.sn_receipt_no, sn_receive_note_no: @company_profile.sn_receive_note_no, sn_sales_order_no: @company_profile.sn_sales_order_no, sn_shipment_schedule: @company_profile.sn_shipment_schedule, sn_shipping_instr_no: @company_profile.sn_shipping_instr_no, sn_store_voucher_no: @company_profile.sn_store_voucher_no, sn_transfer_slip_no: @company_profile.sn_transfer_slip_no, sp_receiving_instr_no: @company_profile.sp_receiving_instr_no, sp_scrap_sheet_no: @company_profile.sp_scrap_sheet_no, tel_no_1: @company_profile.tel_no_1, tel_no_2: @company_profile.tel_no_2 }
    end

    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should show company_profile" do
    get :show, id: @company_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_profile
    assert_response :success
  end

  test "should update company_profile" do
    put :update, id: @company_profile, company_profile: { address: @company_profile.address, fax_no: @company_profile.fax_no, name: @company_profile.name, reg_no: @company_profile.reg_no, sales_tax_no: @company_profile.sales_tax_no, sn_bankin_slip_no: @company_profile.sn_bankin_slip_no, sn_billing_order_no: @company_profile.sn_billing_order_no, sn_credit_note_no: @company_profile.sn_credit_note_no, sn_debit_note_no: @company_profile.sn_debit_note_no, sn_deliver_order_no: @company_profile.sn_deliver_order_no, sn_incoming_reject_no: @company_profile.sn_incoming_reject_no, sn_job_order_no: @company_profile.sn_job_order_no, sn_journal_voucher_no: @company_profile.sn_journal_voucher_no, sn_outgoing_reject_no: @company_profile.sn_outgoing_reject_no, sn_payment_voucher_no: @company_profile.sn_payment_voucher_no, sn_product_price_no: @company_profile.sn_product_price_no, sn_purchase_order_no: @company_profile.sn_purchase_order_no, sn_purchase_req_no: @company_profile.sn_purchase_req_no, sn_receipt_no: @company_profile.sn_receipt_no, sn_receive_note_no: @company_profile.sn_receive_note_no, sn_sales_order_no: @company_profile.sn_sales_order_no, sn_shipment_schedule: @company_profile.sn_shipment_schedule, sn_shipping_instr_no: @company_profile.sn_shipping_instr_no, sn_store_voucher_no: @company_profile.sn_store_voucher_no, sn_transfer_slip_no: @company_profile.sn_transfer_slip_no, sp_receiving_instr_no: @company_profile.sp_receiving_instr_no, sp_scrap_sheet_no: @company_profile.sp_scrap_sheet_no, tel_no_1: @company_profile.tel_no_1, tel_no_2: @company_profile.tel_no_2 }
    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should destroy company_profile" do
    assert_difference('CompanyProfile.count', -1) do
      delete :destroy, id: @company_profile
    end

    assert_redirected_to company_profiles_path
  end
end
