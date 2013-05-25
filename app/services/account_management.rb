class AccountManagement

  def self.manage_receipts(data, receipt)
    if data.present?
      receipt.receipt_statement_lines.delete_all if receipt.receipt_statement_lines.present?
      data.each do |number, content|
        
        @soa = StatementOfAccount.find(number)
        
        if content[:fp] == StatementOfAccount::FULL_PAYMENT or content[:fp] == "f"
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.fp = content[:fp]
          @soa.os_amount = content[:os_amount]
          @soa.save!
          receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
          receipt.save!
        elsif content[:fp] == StatementOfAccount::PARTIAL_PAYMENT or content[:fp] == "p"
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.fp = content[:fp]
          @soa.os_amount = content[:os_amount]
          @soa.save!
          receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
          receipt.save!
          
          @copy_soa = @soa.dup
          @copy_soa.document_amount = content[:os_amount]
          @copy_soa.balance_amount = 0
          @copy_soa.fp = StatementOfAccount::NULL_PAYMENT
          @copy_soa.os_amount = 0
          @copy_soa.parent_id = @soa.id
          @copy_soa.save!
        elsif content[:fp] == StatementOfAccount::TEMP_PAYMENT or content[:fp] == "t"
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.fp = StatementOfAccount::FULL_PAYMENT
          @soa.os_amount = content[:os_amount]
          @soa.save!
          receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
          receipt.save!
        else
          #skip if Null Payment "N"
        end
      
      end
      StatementOfAccount.create!(:trade_company_id => receipt.trade_company_id, :transaction_date => receipt.receipt_date, :transaction_type => StatementOfAccount::RECEIPT, :debit_note_id => 0, :credit_note_id => 0, :receipt_id => receipt.id, :delivery_order_id => 0, :document_amount => receipt.total_amount, :balance_amount => 0, :fp => StatementOfAccount::FULL_PAYMENT, :os_amount => 0)
      return receipt
    end
  end
  
  def self.manage_edit_receipts(data, receipt)
    if data.present?
      receipt.receipt_statement_lines.delete_all if receipt.receipt_statement_lines.present?
      data.each do |number, content|
        @soa = StatementOfAccount.find(number)
        if content[:fp] == StatementOfAccount::NULL_PAYMENT or content[:fp] == "n"
          @soa.document_amount = content[:document_amount].to_f + content[:os_amount].to_f
          @soa.balance_amount = 0
          @soa.os_amount = 0
          @soa.children.delete_all if @soa.children.present?
        else
          @soa.document_amount = content[:document_amount]
          @soa.balance_amount = content[:balance_amount]
          @soa.os_amount = content[:os_amount]
        end
        @soa.fp = content[:fp]
        @soa.save!
        unless content[:fp] == StatementOfAccount::NULL_PAYMENT
          receipt.receipt_statement_lines.build(:statement_of_account_id => @soa.id)
          receipt.save!
        end
      end
      return receipt
    end
  end
  
end