class PurchaseOrderManagement
  
  def self.goto_create_new_sources(select_items, datarow)
    select_items.each do |click_index|
      datarow.each do |key, content|
        if key == click_index
          @pr_item = PurchaseRequisitionItem.find(content[:item_id])
          if @pr_item.present? and content[:company_name].present? and content[:unit_price].present?
            self.goto_create_sources(@pr_item, content[:company_name], content[:unit_price])
            @pr_item.update_attributes(:maintenance => 0, :proposed_vendor => 1)
          end
        end
      end
    end
  end
  
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
  
  # if vendor name must matching common vendor name, will overwrite them...
  def self.generator_match_vendor(vendor, tc_vendor)
    if vendor.present?
      vendor.each do |v|
        if v.temporary_sources.present?
          if v.temporary_sources.find_by_select_vendor(TRUE).present?
            vv = v.temporary_sources.find_by_select_vendor(TRUE)
            tc = tc_vendor.find_by_name(vv.company_name)
            v.update_attributes(:trade_company_id => tc.id, :unit_price => vv.unit_price) if tc.present?
          end
        end
      end
    end
  end
  
  def self.pr_items_status(company_id, po_id)
    @pri = PurchaseRequisitionItem.where("status = ? and trade_company_id = ?", PurchaseRequisitionItem::APPROVED, company_id)
    if @pri.present?
      @pri.each do |pri|
        PurchaseOrderItemLine.create(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id)
        pri.update_attributes(:status => PurchaseRequisitionItem::RECEIVE_NOTE)
        pri.purchase_requisition.update_attributes(:status => PurchaseRequisition::SUBMIT_RN)
      end
    end
  end
  
  def self.pri_status_with_ste(company_id, po_id)
    @pri = PurchaseRequisitionItem.where("status = ? and trade_company_id = ?", PurchaseRequisitionItem::APPROVED, company_id)
    @vendor_id = TradeCompany.find(company_id)
    
    if @pri.present?
      @pri.each do |pri|
        PurchaseOrderItemLine.create!(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id)
        if @vendor_id.sales_tax_exemption.present?
          @barangs = @vendor_id.sales_tax_exemption.sales_tax_exemption_barangs
          if @barangs.present? && pri.product.present?
            if pri.product.tarif_code.present?
                barang = @barangs.find_by_tarif_code(pri.product.tarif_code)
                if barang.present?
                  before_available_qty = barang.available_qty
                  after_available_qty = before_available_qty.to_f - pri.quantity.to_f
                  after_complete_qty = barang.complete_qty.to_f + pri.quantity.to_f
                  stei = SalesTaxExemptionItem.new(:sales_tax_exemption_id => @vendor_id.sales_tax_exemption.id, :product_id => pri.product_id, :purchase_order_id => po_id, :before_available_qty => before_available_qty, :after_available_qty => after_available_qty, :accumulative_complete_qty => after_complete_qty)
                  stei.save!
                  barang.update_attributes!(:complete_qty => after_complete_qty, :available_qty => after_available_qty)
                end
            end
          end
        else
          PurchaseOrderItemLine.create!(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id)
        end
        pri.update_attributes(:status => PurchaseRequisitionItem::RECEIVE_NOTE)
        pri.purchase_requisition.update_attributes(:status => PurchaseRequisition::SUBMIT_RN)
      end
    end
  end
  
  
end