class InventoryHistoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system
  layout "sheetbox"

  def index
#    if params[:select_product].present?
#      @select = TRUE
#      @inventory_histories = InventoryHistory.find_product(params[:select_product]).paginate(:page => params[:page], :per_page => 10)
#      @product_id = @inventory_histories.first
#    else
#      @select = FALSE
#      @inventory_histories = InventoryHistory.grouping.paginate(:page => params[:page], :per_page => 10)
#    end

    @search = InventoryHistory.search(params[:search])
    
  end

  # GET /inventory_histories/1
  # GET /inventory_histories/1.json
  def show
    @inventory_history = InventoryHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_history }
    end
  end

  # GET /inventory_histories/new
  # GET /inventory_histories/new.json
  def new
    @inventory_history = InventoryHistory.new
  end

  # GET /inventory_histories/1/edit
  def edit
    @inventory_history = InventoryHistory.find(params[:id])
  end

  # POST /inventory_histories
  # POST /inventory_histories.json
  def create
    @inventory_history = InventoryHistory.new(params[:inventory_history])
    if params[:product_id].present?
      @inventory_history.product_id = params[:product_id]
      @product = Product.find(params[:product_id])

      @check, msg = InventoryHistory.check_current_stock(params[:product_id], params[:in_out], @inventory_history)

      if @check.present?
        if @inventory_history.save
          if params[:in_out] == "IN"
            @product.update_attributes(:current_stock => @product.current_stock + @inventory_history.stock_in)
          else
            @product.update_attributes(:current_stock => @product.current_stock - @inventory_history.stock_out)
          end
          redirect_to @inventory_history, notice: 'Inventory history was successfully created.'
        else
          render action: "new"
        end
      else
        flash[:alert] = msg
        render action: "new"
      end
    else
      flash[:alert] = "Product ID can't blank."
      render action: "new"
    end
  end

  # PUT /inventory_histories/1
  # PUT /inventory_histories/1.json
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

  # DELETE /inventory_histories/1
  # DELETE /inventory_histories/1.json
  def destroy
    @inventory_history = InventoryHistory.find(params[:id])
    @inventory_history.destroy

    respond_to do |format|
      format.html { redirect_to inventory_histories_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def inventory_management_system
    role(InventoryHistory::ROLE)
  end
end
