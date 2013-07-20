class GroupRunningNosController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /group_running_nos
  # GET /group_running_nos.json
  def index
    @group_running_nos = GroupRunningNo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_running_nos }
    end
  end

  # GET /group_running_nos/1
  # GET /group_running_nos/1.json
  def show
    @group_running_no = GroupRunningNo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_running_no }
    end
  end

  # GET /group_running_nos/new
  # GET /group_running_nos/new.json
  def new
    @group_running_no = GroupRunningNo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_running_no }
    end
  end

  # GET /group_running_nos/1/edit
  def edit
    @group_running_no = GroupRunningNo.find(params[:id])
  end

  # POST /group_running_nos
  # POST /group_running_nos.json
  def create
    @group_running_no = GroupRunningNo.new(params[:group_running_no])

    respond_to do |format|
      if @group_running_no.save
        format.html { redirect_to @group_running_no, notice: 'Group running no was successfully created.' }
        format.json { render json: @group_running_no, status: :created, location: @group_running_no }
      else
        format.html { render action: "new" }
        format.json { render json: @group_running_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_running_nos/1
  # PUT /group_running_nos/1.json
  def update
    @group_running_no = GroupRunningNo.find(params[:id])

    respond_to do |format|
      if @group_running_no.update_attributes(params[:group_running_no])
        format.html { redirect_to @group_running_no, notice: 'Group running no was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_running_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_running_nos/1
  # DELETE /group_running_nos/1.json
  def destroy
    @group_running_no = GroupRunningNo.find(params[:id])
    @group_running_no.destroy

    respond_to do |format|
      format.html { redirect_to group_running_nos_url }
      format.json { head :no_content }
    end
  end
end
