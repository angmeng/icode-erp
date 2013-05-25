class Formulation < ActiveRecord::Base
  attr_accessible :convert_value, :from_unit_measurement_id, :per_value, :to_unit_measurement_id, :status
  
  belongs_to :belongs_from_um, :class_name => "UnitMeasurement", :foreign_key => "from_unit_measurement_id"
  belongs_to :belongs_to_um, :class_name => "UnitMeasurement", :foreign_key => "to_unit_measurement_id"

  validates :convert_value, :from_unit_measurement_id, :per_value, :to_unit_measurement_id, :presence => true
  
  def self.converting(from_um, to_um, current_value)
      formule = Formulation.find_by_from_unit_measurement_id_and_to_unit_measurement_id(from_um, to_um)
      if formule.present?
        a = current_value.to_f * formule.convert_value.to_f
        b = formule.per_value.to_f
        return (a.to_f / b)
      else
        return false
      end
  end
  
  def self.db_active(search)
    search.where(:status => DataStatus::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status => DataStatus::KEEP_IN_VIEW)
  end
end
