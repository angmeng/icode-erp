class CostingSheetFormulation < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :code, :name, :formulation
  
  ACTIVE = "A"
  KEEP_IN_VIEW = "KIV"
  
  scope :db_active, where(:status => CostingSheetFormulation::ACTIVE)
  scope :db_kiv, where(:status => CostingSheetFormulation::KEEP_IN_VIEW)
  
  def self.formula(formula, values)
    # remove anything but Q's, numbers, ()'s, decimal points, and basic math operators 
#    formula.gsub!(/((?![qQ0-9\s\.\-\+\*\/\(\)]).)*/,'').upcase!
    formula.gsub!(/((?![aAbBcCdDeE0-9\s\.\-\+\*\/\(\)]).)*/,'').upcase!
    begin
#      formula.gsub!(/Q\d+/) { |match|
      formula.gsub!(/[A-E]\d+/) { |match|
        ( 
          values[match.to_sym] && 
          values[match.to_sym].class.ancestors.include?(Numeric) ? values[match.to_sym].to_s : '0'
        )
#        +'.0'
      }
      instance_eval(formula)
    rescue Exception => e
      e.inspect
    end
  end
  
  def uppercase_text
    self.formulation.upcase! if self.formulation.present?
    self.name.upcase! if self.name.present?
  end
  
end
