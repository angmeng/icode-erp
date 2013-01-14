module CostingSheetFormulationsHelper
#  def hash_entry(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, fm)
#    
#    f = "#{fm}"
#    values = {:Q1 => a1, :Q2 => a2, :Q3 => a3, :Q4 => a4, :Q5 => a5, :Q6 => a6, :Q7 => a7, :Q8 => a8, :Q9 => a9, :Q10 => a10, :Q11 => a11, :Q12 => a12}
#    return "#{CostingSheetFormulation.formula(f, values)}"  
#  end
  
  def hash_entry(costing_sheet, fm)
    get_formula = CostingSheetFormulation.find(fm)
    fx = "#{get_formula.formulation}"
    f = "#{get_formula.formulation}"
#    values = {:Q1 => a1, :Q2 => a2, :Q3 => a3, :Q4 => a4, :Q5 => a5, :Q6 => a6, :Q7 => a7, :Q8 => a8, :Q9 => a9, :Q10 => a10, :Q11 => a11, :Q12 => a12}
    values = substitution(costing_sheet)
    return three_precision("#{CostingSheetFormulation.formula(f, values)}")
  end
  
  def substitution(cs)
    return {
      :A3 => cs.quantity, 
      :D5 => cs.material_cost_lot
    }
  end
  
#  f = '(q1 + (q2 / 3) + q3 + (q4 * 2))'  # some crazy formula for this survey
#values = {:Q2 => 1, :Q4 => 2}  # values for substitution 
#puts "formula: #{f} = #{Evaluator.formula(f,values)}"  
#=> formula: (0.0 + (1.0 / 3) + 0.0 + (2.0 * 2)) = 4.333333333333333
end
