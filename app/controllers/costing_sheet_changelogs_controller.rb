class CostingSheetChangelogsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /costing_sheet_changelogs
  # GET /costing_sheet_changelogs.json
  def index
    @costing_sheet_changelogs = CostingSheetChangelog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costing_sheet_changelogs }
    end
  end

  # GET /costing_sheet_changelogs/1
  # GET /costing_sheet_changelogs/1.json
  def show
    @costing_sheet_changelog = CostingSheetChangelog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costing_sheet_changelog }
    end
  end

  # GET /costing_sheet_changelogs/new
  # GET /costing_sheet_changelogs/new.json
  def new
    @costing_sheet_changelog = CostingSheetChangelog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costing_sheet_changelog }
    end
  end

  # GET /costing_sheet_changelogs/1/edit
  def edit
    @costing_sheet_changelog = CostingSheetChangelog.find(params[:id])
  end

  # POST /costing_sheet_changelogs
  # POST /costing_sheet_changelogs.json
  def create
    @costing_sheet_changelog = CostingSheetChangelog.new(params[:costing_sheet_changelog])

    respond_to do |format|
      if @costing_sheet_changelog.save
        format.html { redirect_to @costing_sheet_changelog, notice: 'Costing sheet changelog was successfully created.' }
        format.json { render json: @costing_sheet_changelog, status: :created, location: @costing_sheet_changelog }
      else
        format.html { render action: "new" }
        format.json { render json: @costing_sheet_changelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costing_sheet_changelogs/1
  # PUT /costing_sheet_changelogs/1.json
  def update
    @costing_sheet_changelog = CostingSheetChangelog.find(params[:id])

    respond_to do |format|
      if @costing_sheet_changelog.update_attributes(params[:costing_sheet_changelog])
        format.html { redirect_to @costing_sheet_changelog, notice: 'Costing sheet changelog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costing_sheet_changelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costing_sheet_changelogs/1
  # DELETE /costing_sheet_changelogs/1.json
  def destroy
    @costing_sheet_changelog = CostingSheetChangelog.find(params[:id])
    @costing_sheet_changelog.destroy

    respond_to do |format|
      format.html { redirect_to costing_sheet_changelogs_url }
      format.json { head :no_content }
    end
  end
end
