class ProductsDatatable
#   delegate :params, :h, :link_to, :number_to_currency, to: :@view

#   def initialize(view)
#     @view = view
#   end

#   def as_json(options = {})
#     {
#       sEcho: params[:sEcho].to_i,
#       # iTotalRecords: InventoryHistory.count,
#       # iTotalDisplayRecords: total_entries,
#       aaData: data
#     }
#   end

# private

#   def data
#     products.map do |product|
#       [
#         link_to(product.id, product), where 
#         product.product.product_combobox.product_code,
#         product.desc,
#         product.stock_in,
#         product.stock_out,
#         number_with_precision(product.amount, :precision => 2, :separator => '.', :delimiter => ','),
#         product.inventory_issue_description
#         # product.released_on.strftime("%B %e, %Y"),
#         # number_to_currency(product.price)
#       ]
#     end
#   end

#   def products
#     @products ||= fetch_products
#   end

#   def fetch_products
#     products = InventoryHistory.order("#{sort_column} #{sort_direction}")
#     products = products.page(page).per_page(per_page)
#     if params[:sSearch].present?
#       products = products.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
#     end
#     products
#   end

#   def page
#     params[:iDisplayStart].to_i/per_page + 1
#   end

#   def per_page
#     params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
#   end

#   def sort_column
#     columns = %w[name category released_on price]
#     columns[params[:iSortCol_0].to_i]
#   end

#   def sort_direction
#     params[:sSortDir_0] == "desc" ? "desc" : "asc"
#   end


	def datatable
	  @objects = current_objects(params)
	  @total_objectss = total_objects(params)
	  render :layout => false
	end

	private

	def current_objects(params={})
	  current_page = (params[:iDisplayStart].to_i/params[:iDisplayLength].to_i rescue 0)+1
	  @current_objects = ProductCombobox.paginate :page => current_page, 
	                                     :include => [:user], 
	                                     :order => "#{datatable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "DESC"}", 
	                                     :conditions => conditions,
	                                     :per_page => params[:iDisplayLength]
	end

	def total_objects(params={})
	  @total_objects = ProductCombobox.count :include => [:user], :conditions => conditions
	end

	def datatable_columns(column_id)
	  case column_id.to_i
	  when 1
	    return "objects.product_code"
	  when 2
	    return "objects.product.desc"
	  when 3
	    return "objects.product.part_code"
	  when 4
	    return "objects.product.current_stock"
	  when 5
	    return "objects.product.product_vendor.unit_price"
	  when 6
	    return "objects.product.product_customer.selling_price"  
	  else
	    return "objects.product.unit_measurement.code"
	  end
	end

	def conditions
	  conditions = []
	  conditions << "(objects.description ILIKE '%#{params[:sSearch]}%' OR users.name ILIKE '%#{params[:sSearch]}%')" if(params[:sSearch])
	  return conditions.join(" AND ")
	end
end