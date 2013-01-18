class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :are_you_director?
  layout "sheetbox"
  
  def index
    @search = User.search(params[:search])
    @users = User.search_users(@search)  
  end

  def show
    @user = User.find(params[:id])
    checkboxes
  end

  def edit
    @user = User.find(params[:id])
    checkboxes
  end

  def new
    
  end
  
  def create
    
  end
  
  def update
    @user = User.find(params[:id])
    if params[:inventory_management_system].present?
      building_user(params[:new_name], params[:department_id], params[:level], params[:password], params[:job_title], params[:report_to], params[:direct_report])
      if @user.update_attributes(params[:user])
        @user.roles.delete_all
        @user.generate_role(params[:inventory_management_system])
        redirect_to @user, :notice => "Updated successfully."
      else
        checkboxes
        flash[:alert] = @user.errors.full_messages.join(", ")
        render "edit"
      end
    else
      checkboxes
      flash[:alert] = "Please tick the checkboxes on your inventory management system."
      render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.update_attributes!(:status => User::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to users_url, :notice => "The user has dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @user = User.find(params[:id])
    @user.update_attributes(:status => User::ACTIVE)
    redirect_to kiv_users_url, :notice => "The user has recovered from KIV."
  end

  def profile
    @user = User.find(params[:id])
  end
  
  def update_profile
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to profile_user_path(@user), :notice => "Update profile successfully"
    else
      render :action => "profile"
    end
  end
  
  def backup
    BackupUtility.process
    redirect_to root_url, :notice => "Backup Completed"
  end
  
  def authorize
    unless current_user.level == User::LEVEL_FIVE
      render :text => "You are not authorize this zone!!"
    end
  end
  
  def new_user_entry
    # create method will go to generator_user
  end
  
  def generator_user
    if params[:inventory_management_system].present?
      @user = User.new(:name => params[:new_name], :department_id => params[:department_id], :job_title => params[:job_title], :password => take_password(params[:password]), :level_two => params[:lvl_two], :level_three => params[:lvl_three])
      if @user.save
        @user.generate_role(params[:inventory_management_system])
        redirect_to users_path, :notice => "User has created successfully."
      else
        flash[:alert] = @user.errors.full_messages.join(", ")
        render "new_user_entry"
      end
    else
      flash[:alert] = "Please tick the checkboxes on your inventory management system."
      render "new_user_entry"
    end
  end
  
#  def building_user(new_name, department_id, level, password, job_title, report_to, direct_report)
#    @user.name = new_name
#    @user.department_id = department_id
#    @user.password = password unless password.blank?
#    @user.job_title = job_title
#  end
  
  
  
  def kiv
    @search = User.search(params[:search])
    @users = User.ordered_level_kiv(@search)
    @user_department = User.uniq_department
    @user_level = User.uniq_level
    @user_report_to = User.uniq_report_to
  end
  
  def lookup_level
    if params[:lvl].present?
      @user = User.where("status = ? and level = ?", User::ACTIVE, params[:lvl])
    else
      @user = User.where("status = ?", User::ACTIVE)
    end
    render :text => @user.to_json
  end
  
  def clear_database
    User.clearing
    redirect_to root_url, :notice => "Clear completed..."
  end
  
  private
  
  def checkboxes
    @checkboxes = @user.roles.map(&:inventory_management_system_id)
  end
  
  def take_password(password)
    return password unless password.blank?
  end
end
