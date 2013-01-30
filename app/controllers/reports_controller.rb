class ReportsController < ApplicationController

  before_filter :authenticate_user!
  layout "sheetbox"

  def excel_product_report
    if params[:product_ids].present?
      @excel_product_report = ProductCombobox.find(params[:product_ids])
      respond_to do |format|
        format.html
        format.csv { render text: @excel_product_report.to_csv}
        format.xls #{ send_data @excel_pr_report.to_csv(col_sep: "\t") }
      
      end
    else
      redirect_to product_report_reports_path
    end
  end
  
def pdf_pr_report
    #@search = PurchaseRequisition.search(params[:search])
    #@report = @search.all
    #html = "<p> Hello world </p>"  
    #pdfkit_instance = PDFKit.new(html)  
    #send_data(pdfkit_instance.to_pdf)  

    #if params[:p_ids].present?
    #@pr_detail_report = PurchaseRequisition.find(params[:p_ids]) #for show out one id by one id
      #respond_to do |format|
       #   format.html
          
          #format.xls { send_data @products.to_csv(col_sep: "\t") }
        #  format.pdf do
        #    pdf = Prawn::Document.new
        #    pdf.text "test"
        #    send_data pdf.render, :filename => 'pr_detail_report.pdf', 
        #                          :type => 'application/pdf', 
        #                          :disposition => 'inline'

         # end
        #end
     # else
     # end

    if params[:pr_ids].present?
      @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
      respond_to do |format|
        format.html
        format.pdf {
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_pr_report.pdf", 
                                  :type => 'application/pdf' , 
                                  :dispositon => "attachement" )
        #return # to avoid double render call
        }
      
     end
    else
      redirect_to pr_report_reports_path
    end
end

def pdf_po_report
  if params[:po_ids].present?
    @po_detail_report = PurchaseOrder.find(params[:po_ids])
    respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf, :filename => "pdf_po_report.pdf" ,
                               :type => 'application/pdf' ,
                               :disposition => "attachement" )
      }
      end
  else
    redirect_to po_report_reports_path
    #render action: "po_report"
  end
end



def pdf_product_report
  #render :text => params[:pri_ids]
    if params[:pri_ids].present?
      @product_detail_report = ProductCombobox.find(params[:pri_ids])
      respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_product_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
      }
      end
      #manage_categories(params[:category_id])
    else
      redirect_to product_report_reports_path
    end

  
end

def pdf_inventory_report
  #render :text => params[:pri_ids]
    if params[:inventory_ids].present?
      @inventory_detail_report = InventoryHistory.find(params[:inventory_ids])
      respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_inventory_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
      }
      end
    else
      
       redirect_to inventory_report_reports_path
    end
end




def pdf_sale_tax_exemption_report
  if params[:ste_ids].present?
    @show_sale_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
    respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_sale_tax_exemption_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
     }
      end
  else
    
    redirect_to sale_tax_exemption_reports_path
  end

end



def pdf_rn_report
  if params[:rn_ids].present?
    @rn_detail_report = ReceiveNoteItem.find(params[:rn_ids])
    respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_rn_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
        }
      end
  else
    redirect_to rn_report_reports_path
  end
end 

  def purchase_by_creditor_report
    @purchase_by_creditor = PurchaseRequisitionItem.find(params[:search])
    @show_purchase_by_creditor = @purchase_by_creditor.all
    
  end 
  
  def product_report
    @product_report = ProductCombobox.search(params[:search])
    @show_product_report = @product_report.all
    @take_ids = @show_product_report.map(&:id) #for pdf 
  end
  #.where("parent_id = ? and icon = ?", 0, ProductCategory::ICON_FOLDER)


  def company_report
    @company_report = TradeCompany.search(params[:search])
    @show_company_report = @company_report.all
  end


  def pr_report 
    @pr_report = PurchaseRequisition.search(params[:search])
    @show_pr_report = @pr_report.all
    @take_ids = @show_pr_report.map(&:id)
  end

  def rn_report 
    @rn_report = ReceiveNoteItem.search(params[:search])
    @show_rn_report = @rn_report.all
    @take_ids = @show_rn_report.map(&:id)
  end

  def po_report
    @po_report = PurchaseOrder.search(params[:search])
    @show_po_report = @po_report.all
    @take_ids = @show_po_report.map(&:id) #for pdf 
  end

  def customer_report
    @product_customer_report =ProductCustomer.search(params[:search])
    @show_product_customer_report = @product_customer_report.all
  end

  def sales_tax_exemption_report
    @sales_tax_exemption = SalesTaxExemption.search(params[:search])
    @show_sale_tax_exemption_report = @sales_tax_exemption.all
    @take_ids = @show_sale_tax_exemption_report.map(&:id)
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
    @take_ids = @show_inventory_report.map(&:id)
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

