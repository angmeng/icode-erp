class UsersDatatable
   delegate :params, :h, :link_to, :number_to_currency, to: :@view

   def initialize(view)
     @view = view
   end

   def as_json(options = {})
     {
       sEcho: params[:sEcho].to_i,
       iTotalRecords: User.users_active.count,
       iTotalDisplayRecords: users.total_entries,
       aaData: data
     }
   end

 private

   def data
     users.map do |user|
       lv2 = User.find_by_id(user.level_two)
       lv3 = User.find_by_id(user.level_three)
       co_3 = user.department.present? ? user.department.name : '-'
       co_4 = lv2.present? ? lv2.name : '-'
       co_5 = lv3.present? ? lv3.name : '-'
       [
         '', 
         user.name,
         user.job_title,
         co_3,
         co_4,
         co_5
       ]
     end
   end

   def users
     @users ||= fetch_users
   end

   def fetch_users
     users = User.order("#{sort_column} #{sort_direction}")
     users = users.page(page).per_page(per_page)
     if params[:sSearch].present?
       users = users.joins("department level_two level_three").where("name like :search or job_title like :search or department.name like :search or level_two.name like :search or level_three.name like :search", search: "%#{params[:sSearch]}%")
     end
     users
   end

   def page
     params[:iDisplayStart].to_i/per_page + 1
   end

   def per_page
     params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
   end

   def sort_column
     columns = %w[name job_title department level_two level_three]
     columns[params[:iSortCol_0].to_i]
   end

   def sort_direction
     params[:sSortDir_0] == "desc" ? "desc" : "asc"
   end
end