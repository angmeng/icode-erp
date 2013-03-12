class CostingSheetChangelog < ActiveRecord::Base
  attr_accessible :change_log, :costing_sheet_id
  
  belongs_to :costing_sheet
end
