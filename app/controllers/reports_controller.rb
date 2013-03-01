class ReportsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  def excel_product_report

    #if params[:commit] == "Excel"
    if params[:product_ids].present?
      @excel_product_report = ProductCombobox.find(params[:product_ids])
      respond_to do |format|
        format.html
        format.csv { render text: @excel_product_report.to_csv}
        format.xls 
      end
    else
      redirect_to product_report_reports_path
    end
  end

  def excel_inventory_report
    if params[:inventory_ids].present?
      @excel_inventory_report = InventoryHistory.find(params[:inventory_ids])
      respond_to do |format|
      format.html
      format.csv{ render text: @excel_inventory_report.to_csv }
      format.xls
    end
  else
    redirect_to inventory_report_reports_path
  end
end

def excel_pr_report
  if params[:pr_ids].present?
    @excel_pr_report = PurchaseRequisition.search(params[:search])
    respond_to do |format|
      format.html
      format.csv{ render text: @excel_pr_report.to_csv }
      format.xls
    end
  else
    redirect_to pr_report_reports_path
  end
end

def excel_po_report
  if params[:po_ids].present?
    @excel_po_report = PurchaseOrder.search(params[:search])
    repond_to do |format|
      format.html
      format.csv {render text: @excel_po_report.to_csv }
      format.xls
    end
  else
    redirect_to po_report_reports_path
  end
end

   
def pdf_pr_report
#render :text => params[:pr_ids].to_json
  if params[:commit] == "PDF Report"
    if params[:pr_ids].present?
      @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
      html = render_to_string(:layout => false , :action => "pdf_pr_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_pr_report.pdf", 
                                  :type => 'application/pdf' , 
                                  :dispositon => "attachement" )
        #return # to avoid double render call
    end
   
    elsif params[:commit] == "show"
      if params[:pr_ids].present?
      @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
        respond_to do |format|
          format.html
        end
      end 
      #render :text => "this is show function"
    else
      render :text => "No reports found"
      redirect_to pr_report_reports_path
  end
    
end

def pdf_po_report
  if params[:commit] == "PDf report"
   if params[:po_ids].present?
    @po_detail_report = PurchaseOrder.find(params[:po_ids])
    html = render_to_string(:layout => false , :action => "pdf_po_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf, :filename => "pdf_po_report.pdf" ,
                               :type => 'application/pdf' ,
                               :disposition => "attachement" )
  end
  elsif params[:commit] == "show"
    if params[:po_ids].present?
    @po_detail_report = PurchaseOrder.find(params[:po_ids])
    respond_to do |format|
      format.html
    end
  end
  else
    render :test => "No report found"
    redirect_to po_report_reports_path
  end
end



def pdf_product_report
  #render :text => params[:pri_ids]
  if params[:commit] == "PDF report"
    if params[:pro_ids].present?
      @product_detail_report = ProductCombobox.find(params[:pro_ids])
      html = render_to_string(:layout => false , :action => "pdf_product_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_product_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
      end
      #manage_categories(params[:category_id])
    elsif params[:commit] == "show"
      if params[:pro_ids].present?
        @product_detail_report = ProductCombobox.find(params[:pro_ids])
        respond_to do |format|
          format.html
        end
      end
    else
      render :test => "No report found"
      redirect_to product_report_reports_path
    end

end

def pdf_inventory_report 
    if params[:commit] == "PDF report"
      if params[:inventory_ids].present?
        @detail_inventory_report = InventoryHistory.find(params[:inventory_ids])
        html = render_to_string(:layout => false , :action => "pdf_inventory_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf , :filename => "pdf_inventory_report.pdf" ,
                                :type => 'application/pdf', 
                                :disposition => "attachement")
      end
    elsif params[:commit] = "show"
      if params[:inventory_ids].present?
        @detail_inventory_report = InventoryHistory.find(params[:inventory_ids])
        respond_to do |format|
          format.html
        end
      end
    else
      render :test => "No report found"
      redirect_to inventory_report_reports_path      
    end
end
     

    # if params[:inventory_ids].present?
    #    @detail_inventory_report = InventoryHistory.find(params[:inventory_ids])
    #    respond_to do |format|
    #    format.html
    #    # format.json { render json: @detail_inventory_report}
    #    format.pdf {
    #      @kit = PDFKit.new(html)
    #      # send_data(@kit.to_pdf ,:filename => "pdf_inventory_report.pdf" ,
    #      #                       :type => 'application/pdf' , 
    #      #                       :disposition => "attachement" )
    #    }
    #   end
    #  else
    #    #flash[:alert]="please check the checkbox"
    #    redirect_to inventory_report_reports_path 
    # end

  

    # if params[:commit] == "Excel report"
    
    #    if params[:inventory_ids].present?
        
    #    @excel_inventory_report = InventoryHistory.find(params[:inventory_ids])
    # render :text => @excel_inventory_report.to_
    #   respond_to do |format|
    #     format.html
    #     format.csv { render text: @excel_product_report.to_csv}
    #     format.xls 
    #    end
    #   end
    #   else
    #   flash[:alert]="please check the checkbox"
    #    redirect_to inventory_report_reports_path
#       end
#      end
# end


def pdf_sales_tax_exemption_report
  if params[:commit] == "PDF report"
    if params[:ste_ids].present?
    @detail_sales_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
    html = render_to_string(:layout => false , :action => "pdf_sales_tax_exemption_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_sales_tax_exemption_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
     
    end
    elsif params[:commit] == "show"
      if params[:ste_ids].present?
        @detail_sales_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
        respond_to do |format|
          format.html
      end
    end
    else
        render :test => "No report found"
        redirect_to sales_tax_exemption_report_reports_path
    end
end



def pdf_receive_note_report
  if params[:commit] == "PDF report"
    if params[:rn_ids].present?
      @detail_receive_note_report = ReceiveNote.find(params[:rn_ids])
      html = render_to_string(:layout => false , :action => "pdf_receive_note_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_receive_note_report.pdf" ,
                                :type => 'application/pdf' , 
                                :disposition => "attachement" )
        end
    elsif params[:commit] == "show"
      if params[:rn_ids].present?
        @detail_receive_note_report = ReceiveNote.find(params[:rn_ids])
        respond_to do |format|
          format.html
      end
    end
    else
      render :test => "No report found"
      redirect_to receive_note_report_reports_path
    end
end 

  def pdf_purchase_by_creditor_report
    if params[:purchase_ids].present
      @detail_purchase_by_creditor_report = PurchaseRequisitionItem.find(params[:search])
      repond_to do |format|
        format.html
        format.json {render json: @detail_purchase_by_creditor_report }
        format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_purchase_by_creditor_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
        }
      end
    else
      redirect_to purchase_by_creditor_report_reports_path
    end
  end

  def purchase_by_creditor_report
    @purchase_by_creditor = PurchaseRequisitionItem.find(params[:search])
    @show_purchase_by_creditor = @purchase_by_creditor.all
    
  end 
  
  def product_report
    @product_report = ProductCombobox.search(params[:search])
    @show_product_report = @product_report.all
    #@take_ids = @show_product_report.map(&:id) #for pdf 
  end
  #.where("parent_id = ? and icon = ?", 0, ProductCategory::ICON_FOLDER)


  def company_report
    @company_report = TradeCompany.search(params[:search])
    @show_company_report = @company_report.all
  end


  def pr_report 
    @pr_report = PurchaseRequisition.search(params[:search])
    @show_pr_report = @pr_report.all
    #@take_ids = @show_pr_report.map(&:id)
  end

  def receive_note_report 
    @receive_note_report = ReceiveNote.search(params[:search])
    @show_receive_note_report = @receive_note_report.all
    #@take_ids = @show_receive_note_report.map(&:id)
  end

  def rn_part_summary_report
    @rn_part_summary_report = ReceiveNoteItem.search(params[:search])
    @show_rn_part_summary_report = @rn_part_summary_report.all
  end

  def po_report
    @po_report = PurchaseOrder.search(params[:search])
    @show_po_report = @po_report.all
    #@take_ids = @show_po_report.map(&:id) #for pdf 
  end

  def customer_report
    @product_customer_report = ProductCustomer.search(params[:search])
    @show_product_customer_report = @product_customer_report.all
  end

  def sales_tax_exemption_report
    @sales_tax_exemption = SalesTaxExemption.search(params[:search])
    @show_sales_tax_exemption_report = @sales_tax_exemption.all
    #@take_ids = @show_sale_tax_exemption_report.map(&:id)
  end

  def sales_cj5_summary_co
    @sales_cj5_summary_co = SalesTaxExemption.search(params[:search])
    @sales_cj5_summary_co_report = @sales_cj5_summary_co.all
  end

  def price_report
    @price_report = PriceControlItem.search(params[:search])
    @show_price_report = @price_report.all
  end 
 
 
  def inventory_report
    @inventory_report = InventoryHistory.search(params[:search])
    @show_inventory_report = @inventory_report.all
    #@take_ids = @show_inventory_report.map(&:id)
  end
 
end

#private
  
 # def manage_categories(cat_id)
 #   @category_id = cat_id
 #   @listing_categories = ProductCategory.find(@category_id) if @category_id.present?
 #   @field_id = ProductCategory.all_field_id(@listing_categories) if @listing_categories.present?
 #   @show_product = @listing_categories.product if @listing_categories.present?
 # end




 #def pr_pdf_report
    #if params[:p_ids].present?
   # @pr_pdf_report = PurchaseRequisition.find(params[:p_ids]) #for show out one id by one id


    #  respond_to do |format|
    #  format.html
    #  format.pdf do
    #    pdf = Prawn::Document.new
    #    pdf.text "test"
    #    send_data pdf.render, :filename => 'pr_pdf_report.pdf', 
     #                         :type => 'application/pdf' , 
     #                         :disposition => 'inline'
     # end
    #end
    #else
  #end

  #def download_pdf
  #  html = render_to_string(:action => '../pdf/my_template', :layout => false)
  #  pdf = PDFKit.new(html)
  #  send_data(pdf.to_pdf)
  #end

