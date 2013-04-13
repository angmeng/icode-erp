class AccountManagement

  def self.manage_receipts(data, receipt)
    if data.present?
      receipt.receipt_items.delete_all if receipt.receipt_items.present?
      total_amount = receipt.cash_amount.to_f + receipt.cheque_amount.to_f
      data.each do |number, content|
        total_amount -= content[:document_amount].to_f
        receipt.receipt_items.build(:receipt_type => content[:receipt_type], :document_no => content[:document_no], :document_date => content[:document_date], :document_amount => content[:document_amount], :balance_amount => total_amount, :fp => content[:fp], :os_amount => content[:os_amount])
#        unless v_receipt.valid?
#          return false, msg = v_receipt.errors.full_messages
#          break;
#        end
      end
      return receipt
    end
  end
  
end