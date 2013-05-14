class AccountManagement

  def self.manage_receipts(data, receipt)
    if data.present?
      receipt.receipt_statement_lines.delete_all if receipt.receipt_statement_lines.present?
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
  
  def self.manage_edit_receipts(data, receipt)
    if data.present?
      receipt.receipt_statement_lines.delete_all if receipt.receipt_statement_lines.present?
      data.each do |number, content|
        @soa = StatementOfAccount.find(number)
        if content[:fp] == StatementOfAccount::NULL_PAYMENT
          @soa.document_amount = content[:document_amount] + content[:os_amount]
          @soa.balance_amount = 0
          @soa.os_amount = 0
        else
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.os_amount = content[:os_amount]
        end
        @soa.fp = content[:fp].upcase!
        @soa.save!
        receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
        receipt.save!
      end
      return receipt
    end
  end
  
end