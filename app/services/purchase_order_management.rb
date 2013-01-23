class PurchaseOrderManagement
  
  def self.goto_create_sources(pr_item, company_name, unit_price)
    if pr_item.temporary_sources.present?
      pr_item.temporary_sources.find_by_select_vendor(TRUE).update_attributes(:company_name => company_name, :select_vendor => TRUE, :unit_price => unit_price)
    else
      pr_item.temporary_sources.create(:company_name => company_name, :select_vendor => TRUE, :unit_price => unit_price)
    end
  end
  
  def self.overwrite_eta(datarow)
      datarow.each do |id, content|
        @pri = PurchaseRequisitionItem.find(id)
        @pri.update_attributes(:eta => content[:correct_eta])
      end
  end
  
  
end