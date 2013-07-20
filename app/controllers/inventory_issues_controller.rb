class InventoryIssuesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @inventory_issues = InventoryIssue.where(:in_out => params[:type_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_issues }
    end
  end

  # GET /inventory_issues/1
  # GET /inventory_issues/1.json
  def show
    @inventory_issue = InventoryIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_issue }
    end
  end

  # GET /inventory_issues/new
  # GET /inventory_issues/new.json
  def new
    @inventory_issue = InventoryIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory_issue }
    end
  end

  # GET /inventory_issues/1/edit
  def edit
    @inventory_issue = InventoryIssue.find(params[:id])
  end

  # POST /inventory_issues
  # POST /inventory_issues.json
  def create
    @inventory_issue = InventoryIssue.new(params[:inventory_issue])

    respond_to do |format|
      if @inventory_issue.save
        format.html { redirect_to @inventory_issue, notice: 'Inventory issue was successfully created.' }
        format.json { render json: @inventory_issue, status: :created, location: @inventory_issue }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventory_issues/1
  # PUT /inventory_issues/1.json
  def update
    @inventory_issue = InventoryIssue.find(params[:id])

    respond_to do |format|
      if @inventory_issue.update_attributes(params[:inventory_issue])
        format.html { redirect_to @inventory_issue, notice: 'Inventory issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_issues/1
  # DELETE /inventory_issues/1.json
  def destroy
    @inventory_issue = InventoryIssue.find(params[:id])
    @inventory_issue.destroy

    respond_to do |format|
      format.html { redirect_to inventory_issues_url }
      format.json { head :no_content }
    end
  end
end
