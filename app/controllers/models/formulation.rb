class Formulation < ActiveRecord::Base
  attr_accessible :convert_value, :from_unit_measurement_id, :per_value, :to_unit_measurement_id
  
  belongs_to :belongs_from_um, :class_name => "UnitMeasurement", :foreign_key => "from_unit_measurement_id"
  belongs_to :belongs_to_um, :class_name => "UnitMeasurement", :foreign_key => "to_unit_measurement_id"

  validates :convert_value, :from_unit_measurement_id, :per_value, :to_unit_measurement_id, :presence => true
  
  def self.converting(from_um, to_um, current_value)
    formule = Formulation.find_by_from_unit_measurement_id_and_to_unit_measurement_id(from_um, to_um)
    if formule.present?
      a = current_value * formule.convert_value
      b = formule.per_value
      return (a.to_f / b)
    else
      return "No match"
    end
  end
end
