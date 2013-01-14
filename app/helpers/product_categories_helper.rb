module ProductCategoriesHelper
  def gather_field_id(refer_category_id)
    field = ProductField.find_all_by_category_id(refer_category_id) 
    field = field.map(&:field_id) if field.present?
    return field
  end
  
  def answer_level(category_id)
    pc = ProductCategory.find(category_id)
    pc = pc.level
    return pc
  end
end
