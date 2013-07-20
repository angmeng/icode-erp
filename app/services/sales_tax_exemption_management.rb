class SalesTaxExemptionManagement
  def self.running_items(data, ste)
    if data.present?
      ste.sales_tax_exemption_barangs.delete_all if ste.sales_tax_exemption_barangs.present?
      
      data.each do |barang, content|
        # available_qty should be same value with apply_qty
        if content[:unit_measurement_id].to_i != content[:calculate_um_id].to_i
          @formula = Formulation.find_by_from_unit_measurement_id_and_to_unit_measurement_id(content[:unit_measurement_id].to_i, content[:calculate_um_id].to_i)
          if @formula.present?
            answer_value = content[:apply_qty].to_i * @formula.convert_value.to_i
            ste_control = ste.sales_tax_exemption_barangs.build(:perihal_barang => content[:perihal_barang], :apply_qty => content[:apply_qty], :convert_apply_qty => answer_value, :complete_qty => 0, :unit_measurement_id => content[:unit_measurement_id], :tarif_code => content[:tarif_code], :calculate_um_id => content[:calculate_um_id], :available_qty => answer_value, :need_part_weight => content[:need_part_weight])
          else
            msg = []
            a = UnitMeasurement.find(content[:unit_measurement_id])
            b = UnitMeasurement.find(content[:calculate_um_id])
            return false, msg << "From #{a.code} to #{b.code}, the unit measurement conventor was not found."
            break;
          end
        else
          ste_control = ste.sales_tax_exemption_barangs.build(:perihal_barang => content[:perihal_barang], :apply_qty => content[:apply_qty], :convert_apply_qty => content[:apply_qty], :complete_qty => 0, :unit_measurement_id => content[:unit_measurement_id], :tarif_code => content[:tarif_code], :calculate_um_id => content[:calculate_um_id], :available_qty => content[:apply_qty], :need_part_weight => content[:need_part_weight])
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
    @tc.update_attributes(:sales_tax_exemption_id => sales_tax_exemption.id) if @tc.present?
    
    @ste_line = SalesTaxExemptionLine.find_by_trade_company_id(sales_tax_exemption.trade_company_id)
    if @ste_line.present?
      @ste_line.update_attributes!(:sales_tax_exemption_id => sales_tax_exemption.id, :validate_condition => true)
    else
      SalesTaxExemptionLine.create!(:sales_tax_exemption_id => sales_tax_exemption.id, :trade_company_id => sales_tax_exemption.trade_company_id)
    end
    
    @ste = SalesTaxExemption.find_all_by_trade_company_id_and_status(sales_tax_exemption.trade_company_id, SalesTaxExemption::ACTIVE)
    @ste.each do |ste|
      ste.update_attributes(:status => SalesTaxExemption::DEACTIVATE) unless ste.id == sales_tax_exemption.id
    end
  end
end