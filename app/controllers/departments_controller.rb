class DepartmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :are_you_director?
  layout "sheetbox"
  
  # GET /departments
  # GET /departments.json
  def index
    @search = Department.search(params[:search])
    @departments = Department.search_departments(@search)
  end
  
  def kiv
    @search = Department.search(params[:search])
    @departments = Department.ordered_name_kiv(@search)
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(params[:department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render json: @department, status: :created, location: @department }
      else
        format.html { render action: "new" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:department])
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department = Department.find(params[:id])
    @department.update_attributes(:status => Department::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to departments_url, :notice => "This department has moved to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @department = Department.find(params[:id])
    @department.update_attributes(:status => Department::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_departments_url, :notice => "This department has moved out from KIV." }
      format.json { head :no_content }
    end
  end
end
