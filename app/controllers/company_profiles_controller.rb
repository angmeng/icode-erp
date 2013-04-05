class CompanyProfilesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:edit, :create, :update]
  
  
  def index
    render :layout => "sheetbox" if params[:change_layout].present?
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end
  
  def create
    @company_profile = CompanyProfile.new(params[:company_profile])

    respond_to do |format|
      if @company_profile.save
        format.html { redirect_to company_profiles_path, notice: 'Company profile was successfully created.' }
        format.json { render json: @company_profile, status: :created, location: @company_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
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

  def destroy
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.destroy

    respond_to do |format|
      format.html { redirect_to company_profiles_url }
      format.json { head :no_content }
    end
  end
end
