class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_director
  layout false
  
  def index
    
    copy_index
    render :layout => "application"

    # for sample
#    @user_header = User::HEADER_TITLE
#    @users = User.searching_keyword(params[:keyword])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @checkboxes = @user.roles.map(&:inventory_management_system_id)
  end

  def new
    
  end
  
  def create
    
  end
  
  def update
    @user = User.find(params[:id])
    if params[:inventory_management_system].present?
      building_user(params[:new_email], params[:new_name], params[:department_id], params[:level], params[:password])
      if @user.update_attributes(params[:user])
        @user.roles.delete_all
        @user.generate_role(params[:inventory_management_system])
        redirect_to @user, :notice => "You have updated user."
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
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
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
  
  def generator_user
    if params[:inventory_management_system].present?
      @user = User.new
      building_user(params[:new_email], params[:new_name], params[:department_id], params[:level].to_i, params[:password])
      if @user.save
        @user.generate_role(params[:inventory_management_system])
        redirect_to users_path, :notice => "You have created new user."
      else        
        copy_index
        flash[:alert] = @user.errors.full_messages.join(", ")
        redirect_to users_path
      end
    else
      copy_index
      flash[:alert] = "Please tick the checkboxes on your inventory management system."
      redirect_to users_path
    end
  end
  
  def building_user(new_email, new_name, department_id, level, password)
    @user.email = new_email
    @user.name = new_name
    @user.department_id = department_id
    @user.level = level
    @user.password = password unless password.blank?
  end
  
  def new_user_entry
    render :layout => "application"
  end
  
  private
  
  def checkboxes
    @checkboxes = @user.roles.map(&:inventory_management_system_id)
  end
  
  def copy_index
    @user_header = User::HEADER_TITLE
    @search = User.search(params[:search])
    @users = @search.paginate(:page => params[:page], :per_page => 10)
    @users = @users.order("name")
    @user_department = User.uniq_department
    @user_level = User.uniq_level
  end
end
