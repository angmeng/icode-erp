class PurchaseRequisitionManagement
  
  def self.arrange(user, purchase_requisition, pr_value, boss)
    @user = user
    @purchase_requisition           = purchase_requisition
    @purchase_requisition.pr_no     = pr_value
    if user.has_level_two?
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_TWO
      @purchase_requisition.tasks   = user.level_two
    elsif user.has_level_three?
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_THREE
      @purchase_requisition.tasks   = user.level_three
    elsif user.is_admin?
      @purchase_requisition.status  = PurchaseRequisition::SUBMIT_PO
      @purchase_requisition.tasks   = 0
    else
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_FIVE
      @purchase_requisition.tasks   = boss.id
    end
    return @purchase_requisition
  end
  
  def self.run_update(user, purchase_requisition, select_items)
    user_pending = user.purchase_requisition_items.where(:status => PurchaseRequisitionItem::PENDING).find(select_items)
    user_pending.each do |p|
      if user.is_admin?
        if p.is_skip_to_po?
          p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::APPROVED, :maintenance => false, :proposed_vendor => true, :approval_proposed => true)
        else
          p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::APPROVED)
        end
      else
        p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::IN_PROCESSING)
      end
    end
  end
  
  def self.running_new_temporary(purchase_requisition_item, company_name, estimated_price)
    @purchase_requisition_item = purchase_requisition_item
    @purchase_requisition_item.temporary_sources.delete_all if @purchase_requisition_item.temporary_sources.present?
    if @purchase_requisition_item.product_id.present?
      prod = Product.find(@purchase_requisition_item.product_id)
      @purchase_requisition_item.description = prod.desc
      @purchase_requisition_item.unit_measurement_id = prod.unit_measurement_id
    end
    # Include New Product ID and Exist Product ID, except in maintenance
    if @purchase_requisition_item.is_skip_to_po?
      @purchase_requisition_item.temporary_sources.new(:company_name => company_name, :select_vendor => TRUE, :unit_price => estimated_price)
    else
      @purchase_requisition_item.temporary_sources.new(:company_name => company_name, :select_vendor => TRUE, :unit_price => estimated_price)
      @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
      @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
    end
    return @purchase_requisition_item
  end
  
  def self.completed_update(app_three)
    all_pending = app_three.purchase_requisition_items.where(:status => PurchaseRequisitionItem::IN_PROCESSING)
    if all_pending.present?
      all_pending.each do |p|
        if p.is_skip_to_po?
          p.update_attributes(:status => PurchaseRequisitionItem::APPROVED, :maintenance => false, :proposed_vendor => true, :approval_proposed => true)
        else
          p.update_attributes(:status => PurchaseRequisitionItem::APPROVED)
        end
      end
    end
  end
  
end