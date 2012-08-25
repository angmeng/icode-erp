class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
#  To verify if a user is signed in, use the following helper:
#
#  user_signed_in?
#  For the current signed-in user, this helper is available:
#
#  current_user
#  You can access the session for this scope:
#
#  user_session
#  After signing in a user, confirming the account or updating the password, Devise will look for a scoped root path to redirect. Example: For a :user resource, it will use +user_root_path+ if it exists, otherwise default +root_path+ will be used. This means that you need to set the root inside your routes:
#
#  root :to => "home#index"
#  You can also overwrite +after_sign_in_path_for+ and +after_sign_out_path_for+ to customize your redirect hooks.
#  Notice that if your devise model is not called "user" but "member", then the helpers you should use are:
#
#  before_filter :authenticate_member!
#
#  member_signed_in?
#
#  current_member
#
#  member_session

  helper_method :company
  helper_method :payment_type
  helper_method :trade_term
  helper_method :type_of_sale
  helper_method :unit_measurement
  helper_method :currency
  helper_method :transport
  helper_method :trade_company
  helper_method :trade_name
  helper_method :trade_company_customer
  helper_method :sales_tax_exemption
  helper_method :issues_in
  helper_method :issues_out
  helper_method :roles

  
  def company
    @company ||= CompanyProfile.first
  end
  
  def payment_type
    @payment_type ||= PaymentType.ordered
  end
  
  def trade_term
    @trade_term ||= TradeTerm.all
  end
  
  def type_of_sale
    @type_of_sale ||= TypeOfSale.ordered
  end
  
  def unit_measurement
    @unit_measurement ||=  UnitMeasurement.ordered
  end

  def currency
    @currency ||= Currency.ordered
  end
  
  def transport
    @transport ||= Transport.ordered
  end
  
  def trade_company
    @trade_company ||= TradeCompany.ordered_code
  end
  
  def trade_name
    @trade_name ||= TradeCompany.ordered_name
  end
  
  def trade_company_customer
    @trade_company_customer ||= TradeCompany.ordered_with_customer_name
  end
  
  def sales_tax_exemption
    @sales_tax_exemption ||= SalesTaxExemption.order_licence
  end
  
  def issues_in
    @issues_in ||= InventoryIssue.ordered_in
  end
  
  def issues_out
    @issues_out ||= InventoryIssue.ordered_out
  end
  
  def product_suppliers
    @product_suppliers ||= Product.collection_suppliers
  end
  
  def goto_direction(this)
      if this.category_type == ProductCategory::NON_OPERATION
        redirect_to non_operation_product_categories_path
      elsif this.category_type == ProductCategory::OPERATION
        redirect_to operation_product_categories_path
      else
        redirect_to finish_good_product_categories_path
      end
  end
  
  def layout_false
    render :layout => false
  end
  
  def roles
    @roles = current_user.roles.map(&:inventory_management_system_id)
  end
  
  private
  
  def is_director
    unless current_user.level == User::LEVEL_FIVE
      flash[:alert] = "You are not authorize!!"
      redirect_to root_url
    end
  end
  
  def role(model_array)
    model_array.each do |role|
      unless roles.include?(role)
        break;
        flash[:alert] = "You are not authorize!"
        redirect_to root_url
      end
    end
  end
 
end
