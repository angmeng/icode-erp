class Report < ActiveRecord::Base

  # attr_accessible :created_date
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |p|
        csv << p.attributes.values_at(*column_names)
      end
    end
  end


  def self.pdf_do_so_documentation_report(doc_ids)
    doc_ids.each do |doc_id|
      doc = HistoryInvoice.new(:created_date => Date.today, :delivery_order_id => doc_id) 
      doc.save!
    end
  end

  def total_date_amount(balance)
     balance = DeliveryOrder.first.calculate_sum_of_doi
    StatementOfAccount.select("date(transaction_date) as ordered_date, sum(balance) 
      as total_price").group("date(transaction_date)")
  end

  
end