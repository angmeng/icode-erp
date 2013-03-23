module UsersHelper
  def ims_show_disabled(role_authorize, role_name)
    check_box_tag "inventory_management_system[]", role_name, role_authorize.include?(role_name), :disabled => true
  end
  
  def ims_edit_checked(role_authorize, role_name)
    check_box_tag "inventory_management_system[]", role_name, role_authorize.include?(role_name)
  end
  
  def ims_new(role_name)
    check_box_tag "inventory_management_system[]", role_name
  end
end
