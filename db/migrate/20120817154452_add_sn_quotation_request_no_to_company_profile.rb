class AddSnQuotationRequestNoToCompanyProfile < ActiveRecord::Migration
  def change
    add_column :company_profiles, :sn_quotation_request_no, :integer, :default => 0
  end
end
