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
  helper_method :trade_company_both
  helper_method :trade_company_vendor
  helper_method :trade_company_vendor_with_code
  helper_method :trade_company_customer
  helper_method :trade_company_customer_with_code
  helper_method :product_non_operation_n_operation_with_combobox
  helper_method :product_non_operation_n_operation_with_pr_combobox
  helper_method :product_finish_goods_with_combobox
  helper_method :ste_no_with_valid
  helper_method :ste_no_with_not_valid
  helper_method :perihal_barangs_vendor
  helper_method :issues_in
  helper_method :issues_out
  helper_method :roles
  helper_method :users
  helper_method :material
  helper_method :perihal_barang_both
  
  
  def company
    @company ||= CompanyProfile.first
  end
  
  def perihal_barang_both
    @perihal_barang_both ||= SalesTaxExemptionBarang.where(:valid_condition => TRUE)
  end
  
  def payment_type
    @payment_type ||= PaymentType.ordered
  end
  
  def trade_term
    @trade_term ||= TradeTerm.ordered
  end
  
  def type_of_sale
    @type_of_sale ||= TypeOfSale.ordered
  end
  
  def unit_measurement
    @unit_measurement ||=  UnitMeasurement.ordering_code
  end

  def currency
    @currency ||= Currency.ordered
  end
  
  def transport
    @transport ||= Transport.ordered
  end
  
  def trade_company_both
    @trade_company_both ||= TradeCompany.ordered_with_both
  end
  
  #vendor only, including in Purchase Order
  def trade_company_vendor 
    @trade_company_vendor ||= TradeCompany.ordered_with_vendor_name
  end
  
  def trade_company_vendor_with_code        #only vendor comboboxes
    @trade_company_vendor_with_code ||= TradeCompany.vendor_with_code
  end
  
  def trade_company_customer
    @trade_company_customer ||= TradeCompany.ordered_with_customer_name
  end
  
  def trade_company_customer_with_code      #only customer comboboxes
    @trade_company_customer_with_code ||= TradeCompany.customer_with_code
  end
  
  def product_non_operation_n_operation_with_combobox
    @product_non_operation_n_operation_with_combobox ||= ProductCombobox.db_active_both_operation
  end
  
  def product_non_operation_n_operation_with_pr_combobox
    @product_non_operation_n_operation_with_pr_combobox ||= ProductCombobox.pr_comboboxes
  end

  def product_finish_goods_with_combobox
#    @product_finish_goods ||= ProductCombobox.finish_goods
    @product_finish_goods_with_combobox = ProductCombobox.qr_comboboxes
  end
  
#  def trade_company_subcon
#    @trade_company_subcon ||= TradeCompany.ordered_with_subcon_name
#  end
  
  def ste_no_with_valid
#    @ste_no_with_valid ||= SalesTaxExemption.ordered_ste_no_with_valid
    @ste_no_with_valid ||= SalesTaxExemption.ste_with_valid
  end
  
  def ste_no_with_not_valid
#    @ste_no_with_not_valid ||= SalesTaxExemption.ordered_ste_no_with_not_valid
    @ste_no_with_not_valid ||= SalesTaxExemption.ste_with_invalid
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
  
  def users
    @users ||= User.ordered_name
  end
  
  def material
    @material ||= Material.where(:status => Material::ACTIVE)
  end
  
  def goto_direction(this)
    if this.category_type == ProductCategory::FINISH_GOOD
      redirect_to finish_good_products_path
    elsif this.category_type == ProductCategory::NON_OPERATION
      redirect_to non_operation_products_path
    elsif this.category_type == ProductCategory::OPERATION
      redirect_to operation_products_path
    else
      render :text => "Something wrong.."
    end
  end
  
  def goto_direction_kiv(this)
    if this.category_type == ProductCategory::FINISH_GOOD
      redirect_to kiv_finish_good_products_path
    elsif this.category_type == ProductCategory::NON_OPERATION
      redirect_to kiv_non_operation_products_path
    elsif this.category_type == ProductCategory::OPERATION
      redirect_to kiv_operation_products_path
    else
      render :text => "Something wrong.."
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