class SalesTaxExemptionManagement
  def self.running_items(data, ste)
    if data.present?
      ste.sales_tax_exemption_barangs.delete_all if ste.sales_tax_exemption_barangs.present?
      
      data.each do |barang, content|
        # available_qty should be same value with apply_qty
        if content[:unit_measurement_id].to_i != content[:calculate_um_id].to_i
          @formula = Formulation.where(:from_unit_measurement_id => content[:unit_measurement_id].to_i, :to_unit_measurement_id => content[:calculate_um_id].to_i).last
          if @formula.present?
            answer_value = content[:apply_qty].to_i * @formula.convert_value.to_i
            ste_control = ste.sales_tax_exemption_barangs.build(:perihal_barang => content[:perihal_barang], :apply_qty => content[:apply_qty], :complete_qty => 0, :unit_measurement_id => content[:unit_measurement_id], :tarif_code => content[:tarif_code], :calculate_um_id => content[:calculate_um_id], :available_qty => answer_value)
          else
            msg = []
            a = UnitMeasurement.find(content[:unit_measurement_id])
            b = UnitMeasurement.find(content[:calculate_um_id])
            return false, msg << "From #{a.code} to #{b.code}, the unit measurement conventor was not found."
            break;
          end
        else
          ste_control = ste.sales_tax_exemption_barangs.build(:perihal_barang => content[:perihal_barang], :apply_qty => content[:apply_qty], :complete_qty => 0, :unit_measurement_id => content[:unit_measurement_id], :tarif_code => content[:tarif_code], :calculate_um_id => content[:calculate_um_id], :available_qty => content[:apply_qty])
        end
        
        unless ste_control.valid?
          return false, msg = ste_control.errors.full_messages
          break;
        end  
      end
      
      return ste
    end
  end
  
  def self.connect_company(sales_tax_exemption)
    @tc = TradeCompany.find(sales_tax_exemption.trade_company_id)
    @tc.update_attributes(:sales_tax_exemption_id => sales_tax_exemption.id)
  end
end