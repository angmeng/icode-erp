class PurchaseOrderManagement
  
  def self.goto_create_sources(pr_item, company_name, unit_price)
    if pr_item.temporary_sources.present?
      pr_item.temporary_sources.find_by_select_vendor(TRUE).update_attributes(:company_name => company_name, :select_vendor => TRUE, :unit_price => unit_price)
    else
      pr_item.temporary_sources.create(:company_name => company_name, :select_vendor => TRUE, :unit_price => unit_price)
    end
  end
  
#  def self.arrange(user, purchase_requisition, pr_value)
#    @user = user
#    @purchase_requisition           = purchase_requisition
#    @purchase_requisition.pr_no     = pr_value
#    if user.has_level_two?
#      @purchase_requisition.status  = PurchaseRequisition::LEVEL_TWO
#      @purchase_requisition.tasks   = user.level_two
#    elsif user.has_level_three?
#      @purchase_requisition.status  = PurchaseRequisition::LEVEL_THREE
#      @purchase_requisition.tasks   = user.level_three
#    else
#      @purchase_requisition.status  = PurchaseRequisition::LEVEL_FIVE
#      @purchase_requisition.tasks   = director_data.id
#    end
#    return @purchase_requisition
    
    #*************************** FYI ********************************************************************
    #    if current_user.direct_report == TRUE
    #      boss = User.find_by_level(5)
    #      @purchase_requisition.status = PurchaseRequisition::LEVEL_FIVE
    #      @purchase_requisition.tasks = boss.id
    #    else
    #      @purchase_requisition.status = PurchaseRequisition.generate_level(current_user)
    #      @purchase_requisition.tasks = current_user.report_to
    #    end
    #****************************************************************************************************
#  end
  
#  def self.run_update(user, purchase_requisition, select_items)
#    user_pending = user.purchase_requisition_items.where(:status => PurchaseRequisitionItem::PENDING).find(select_items)
#    user_pending.each do |p|
#      if user.is_admin?
#        p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::APPROVED)
#      else
#        p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::IN_PROCESSING)
#      end
#    end
#  end
  
#  def self.running_new_temporary(purchase_requisition_item, company_name, estimated_price)
#    @purchase_requisition_item = purchase_requisition_item
#    if @purchase_requisition_item.product_id.present?
#      prod = Product.find(@purchase_requisition_item.product_id)
#      @purchase_requisition_item.description = prod.desc
#      @purchase_requisition_item.unit_measurement_id = prod.unit_measurement_id
#    end
#    @purchase_requisition_item.temporary_sources.delete_all if @purchase_requisition_item.temporary_sources.present?
#    @purchase_requisition_item.temporary_sources.new(:company_name => company_name, :select_vendor => TRUE, :unit_price => estimated_price)
#    @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
#    @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
#    return @purchase_requisition_item
#  end
#  
end