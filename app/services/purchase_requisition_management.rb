class PurchaseRequisitionManagement
  
  def self.arrange(user, purchase_requisition, pr_value)
    @user = user
    @purchase_requisition           = purchase_requisition
    @purchase_requisition.pr_no     = pr_value
    if user.has_level_two?
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_TWO
      @purchase_requisition.tasks   = user.level_two
    elsif user.has_level_three?
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_THREE
      @purchase_requisition.tasks   = user.level_three
    else
      @purchase_requisition.status  = PurchaseRequisition::LEVEL_FIVE
      @purchase_requisition.tasks   = director_data.id
    end
    return @purchase_requisition
    
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
  end
  
  def self.run_update(user, purchase_requisition, select_items)
    user_pending = user.purchase_requisition_items.where(:status => PurchaseRequisitionItem::PENDING).find(select_items)
    user_pending.each do |p|
      if user.is_admin?
        p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::APPROVED)
      else
        p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::IN_PROCESSING)
      end
    end
  end
  
  def self.running_new_temporary(purchase_requisition_item, company_name, estimated_price)
    @purchase_requisition_item = purchase_requisition_item
    if @purchase_requisition_item.product_id.present?
      prod = Product.find(@purchase_requisition_item.product_id)
      @purchase_requisition_item.description = prod.desc
      @purchase_requisition_item.unit_measurement_id = prod.unit_measurement_id
    end
    @purchase_requisition_item.temporary_sources.delete_all if @purchase_requisition_item.temporary_sources.present?
    @purchase_requisition_item.temporary_sources.new(:company_name => company_name, :select_vendor => TRUE, :unit_price => estimated_price)
    @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
    @purchase_requisition_item.temporary_sources.new(:company_name => "-",          :select_vendor => FALSE, :unit_price => 0)
    return @purchase_requisition_item
  end
  
#  def self.process(routine_id, options = {})
#  	@routine    = Routine.find_by_id routine_id
#  	@from_date  = options[:from_date]
#  	@to_date    = options[:to_date]
#  	@result     = {}
#  	if validates
#  	  generate
#  	else
#  	  return @result
#  	end
#  end

#  def self.generate
#  	@routine.schedules.each do |schedule|
#      @from_date.to_date.upto(@to_date.to_date).each do |date|
#        add(schedule, date) if schedule.weekday == date.wday
#      end
#    end
#  	@result[:status] = :success;@result[:message] = "Generated successfully"
#  	@result
#  end

#  def self.add(schedule, option_date)
#    depart = @routine.departures.new
#    depart.sales_quota  = schedule.sales_quota
#    depart.online_quota = schedule.online_quota
#    depart.status_id    = DepartureStatusType::OPEN
#    depart.extra_trip   = schedule.extra_trip
#    if schedule.extra_trip?
#      depart.date       = schedule.departure_date
#    else
#      depart.date       = option_date
#    end
#    depart.time         = schedule.departure_time
#    depart.save! unless @routine.departures.where("date = ? and time = ?", depart.date, depart.time).first
#  end

#  def self.validates
#  	validate_routine
#  	validate_date
#  	@result[:status] == :error ? false : true
#  end

#  def self.validate_routine
#  	unless @routine
#  	  @result[:status] = :error;@result[:message] = "Must select a route"
#  	end
#  end

#  def self.validate_date
#  	if @from_date.blank? || @to_date.blank?
#  	  @result[:status] = :error;@result[:message] = "Must select date from and date to"
#  	  return
#    end
#    unless @from_date.to_date <= @to_date.to_date
#      @result[:status] = :error;@result[:message] = "Must select a valid range of date"
#    end
#    rescue Exception => e
#      @result[:status] = :error;@result[:message] = e.message
#  end

  
end