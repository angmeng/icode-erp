class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def show
  end

  def edit
  end

  def new
  end
  
  def create
  end
  
  def update
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
end
