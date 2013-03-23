class AddRecoverStatusToQuotationRequestForm < ActiveRecord::Migration
  def change
    add_column :quotation_request_forms, :recover_status, :string
  end
end
