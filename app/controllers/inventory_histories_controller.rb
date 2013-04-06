class InventoryHistoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]

  def index
    @search = InventoryHistory.search(params[:search])
    @inventories = @search.paginate(:page => params[:page])
  end

  def show
    @inventory_history = InventoryHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_history }
    end
  end

  def new
    @inventory_history = InventoryHistory.new
  end

  def edit
    @inventory_history = InventoryHistory.find(params[:id])
  end

  def create
    @inventory_history = InventoryHistory.new(params[:inventory_history])
    @inventory_history.product_id = params[:product_id]
    @product = Product.find(params[:product_id])
    @check, msg = InventoryManagement.check_current_stock(params[:product_id], params[:in_out], @inventory_history)
    
    if @check.present? && @inventory_history.save
      params[:in_out] == "IN" ? @product.update_attributes(:current_stock => @product.current_stock + @inventory_history.stock_in) : @product.update_attributes(:current_stock => @product.current_stock - @inventory_history.stock_out)
      redirect_to @inventory_history, notice: 'New Inventory was successfully created.'
    else
      msg.present? ? msg : msg = []
      msg << @inventory_history.errors.full_messages
      flash[:alert] = msg.join(", ")
      render action: "new"
    end
  end

  def update
    @inventory_history = InventoryHistory.find(params[:id])

    respond_to do |format|
      if @inventory_history.update_attributes(params[:inventory_history])
        format.html { redirect_to @inventory_history, notice: 'Inventory history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory_history = InventoryHistory.find(params[:id])
    @inventory_history.update_attributes!(:status => InventoryHistory::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to inventory_histories_url, :notice => "This inventory was dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  private
  
  def inventory_management_system
    role(InventoryHistory::ROLE)
  end
end
