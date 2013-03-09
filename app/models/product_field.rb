class ProductField < ActiveRecord::Base
  attr_accessible :category_id, :field_id
  
  DESCRIPTION       = 1
  GSM               = 2
  WIDTH             = 3
  LENGTH            = 4
  HEIGHT            = 5
  TICKNESS          = 6
  ORIGIN            = 7
  BRAND             = 8
  GRADE             = 9
  PACKING_METHOD    = 10
#  QTY_PER_PALLET    = 11
  PACKING_QTY       = 12
  
  UNIT_MEASURE      = 13
  TARIF_CODE        = 14
  PART_WEIGHT       = 15
  CONTAINER_NO      = 16
  SEAL_NO           = 17
  DESPATCH_ADVISE   = 18
  SIZE              = 19
  MODEL_NO          = 20
  REORDER_NO        = 21
  ART_NO            = 22
  REF_NO            = 23
  WORK_ORDER_NO     = 24
  
  MFG_DATE          = 25
  EXP_DATE          = 26
  FILM_NO           = 27
  BAR_CODE          = 28
  LOT_NO            = 29
  ITEM_CODE         = 30
  PART_CODE         = 31
  PANTONE_CODE      = 32
  COLOUR            = 33
  SERIAL_NO         = 34
  WARRANTY          = 35
  CAPACITY          = 36
  
  DIAMETER          = 37  
  VOLTAGE           = 38
  WATT              = 39
  PIN               = 40
  AMPERE            = 41
  HP                = 42
  HZ                = 43
  PURENESS          = 44
  TON               = 45
  CONSIGNEE         = 46
  DESTINATION       = 47
  PROCESS           = 48
  BUFFER_STOCK      = 49
  MOULD_NO          = 50
  
  CATEGORY          = 51
  REVISION          = 52
  WINDOW_CODE       = 53
  
  # only available level 0
#  def self.checkbox_field(category, prod_field)
#    if prod_field.present?
#      prod_field.each { |pf| self.create!(:category_id => category.id, :field_id => pf) }
#    else
#      self.create!(:category_id => category.id, :field_id => ProductField::DESCRIPTION)
#    end
#    category.update_attributes(:exist_field => TRUE, :refer_category_id => category.id, :level => category.level)
#  end
  
  # when edit sub group/product type, only available level 1
#  def self.checkbox_field_edit(category, prod_field)
#    if prod_field.present?
#      @pf = self.where(:category_id => category.refer_category_id)
#      @pf.delete_all if @pf.present?
#      prod_field.each { |pf| self.create!(:category_id => category.refer_category_id, :field_id => pf) }
#    end
#  end
end
