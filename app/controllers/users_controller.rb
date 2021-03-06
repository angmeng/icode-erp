class UsersController < ApplicationController
  before_filter :are_you_director?
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update, :new_user_entry]
  
  def index
    @search = User.search(params[:search])
    @users  = User.search_users(@search).paginate(:page => params[:page])
  end
  
  def kiv
    @search = User.search(params[:search])
    @users  = User.search_users_kiv(@search).paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    checkboxes
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.update_attributes!(:status => User::KEEP_IN_VIEW)
    redirect_to users_url, :notice => "The user has dropped to KIV."
  end
  
  def recover
    @user = User.find(params[:id])
    @user.update_attributes(:status => User::ACTIVE)
    redirect_to kiv_users_url, :notice => "The user has recovered from KIV."
  end

  def new_user_entry
    # create method will go to generator_user
  end
  
  def generator_user
    if params[:inventory_management_system].present?
      @user = User.new(:name => params[:new_name], :department_id => params[:department_id], :job_title => params[:job_title], :password => take_password(params[:password]), :level_two => params[:lvl_two], :level_three => params[:lvl_three])
      if @user.save
        UserRegister.generate_role(@user, params[:inventory_management_system])
        redirect_to user_path(@user), :notice => "User has created successfully."
      else
        flash[:alert] = @user.errors.full_messages.join(", ")
        render "new_user_entry"
      end
    else
      flash[:alert] = "Please tick the checkboxes on your inventory management system."
      render "new_user_entry"
    end
  end

  def edit
    @user = User.find(params[:id])
    checkboxes
  end
  
  def update
    @user = User.find(params[:id])
    if params[:inventory_management_system].present?
      if @user.update_attributes(:name => params[:new_name], :department_id => params[:department_id], :job_title => params[:job_title], :password => take_password(params[:password]), :level_two => params[:lvl_two], :level_three => params[:lvl_three])
        UserRegister.generate_role(@user, params[:inventory_management_system])
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

  def authorize
    unless current_user.level == User::LEVEL_FIVE
      render :text => "You are not authorize this zone!!"
    end
  end

#  def update_profile
#    @user = User.find(params[:id])
#    if @user.update_attributes(params[:user])
#      redirect_to profile_user_path(@user), :notice => "Update profile successfully"
#    else
#      render :action => "profile"
#    end
#  end
  
#  def backup
#    BackupUtility.process
#    redirect_to root_url, :notice => "Backup Completed"
#  end

  private
  
  def checkboxes
    @checkboxes = @user.roles.map(&:inventory_management_system_id)
  end
  
  def take_password(password)
    return password unless password.blank?
  end
end