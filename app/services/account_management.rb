class AccountManagement

  def self.manage_receipts(data, receipt)
    if data.present?
      receipt.receipt_statement_lines.delete_all if receipt.receipt_statement_lines.present?
#      total_amount = receipt.cash_amount.to_f + receipt.cheque_amount.to_f
      data.each do |number, content|
        unless content[:fp] == StatementOfAccount::NULL_PAYMENT
          @soa = StatementOfAccount.find(number)
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.fp = content[:fp].upcase!
          @soa.os_amount = content[:os_amount]
          @soa.save!
          receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
          receipt.save!
        end
      end
      return receipt
    end
  end
  
end