class CompanyProfilesController < ApplicationController
  before_filter :security_url
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]

  def index
    render :layout => "sheetbox" if params[:change_layout].present?
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    
    respond_to do |format|
      if @company_profile.update_attributes(params[:company_profile])
        format.html { redirect_to company_profiles_path, notice: 'Company profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def security_url
    if action_name == "index"
      prohibit_html unless roles.include?(InventoryManagementSystem::COMPANY_PROFILE_MENU)
    elsif action_name == "edit"
      prohibit_html unless roles.include?(InventoryManagementSystem::COMPANY_PROFILE_EDIT)
    elsif action_name == "update"
      prohibit_html unless roles.include?(InventoryManagementSystem::COMPANY_PROFILE_EDIT)
    end
  end
end
