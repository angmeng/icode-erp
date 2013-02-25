class ReportsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  def excel_product_report
#    if params[:product_ids].present?
#      @excel_product_report = ProductCombobox.find(params[:product_ids])
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
<<<<<<< HEAD
      format.pdf {
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_inventory_report.pdf", 
                                  :type => 'application/pdf' , 
                                  :dispositon => "attachement" )
        #return # to avoid double render call
        }
=======
>>>>>>> ab1e81044f9b75a805e2b04a3899e06677ecdbf9
      
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
<<<<<<< HEAD
      
=======
>>>>>>> ab1e81044f9b75a805e2b04a3899e06677ecdbf9
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
      @detail_pr_report = PurchaseRequisitionItem.find(params[:pr_ids])
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
     if params[:inventory_ids].present?
       @pdf_inventory_report = InventoryHistory.find(params[:inventory_ids])
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
       #flash[:alert]="please check the checkbox"
       redirect_to inventory_report_reports_path 
    end
end
  

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
    
    redirect_to sale_tax_exemption_report_reports_path
  end

end



def pdf_receive_note_report
  if params[:rn_ids].present?
    @receive_note_detail_report = ReceiveNoteItem.find(params[:rn_ids])
    respond_to do |format|
      format.html
      format.pdf {
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_receive_note_report.pdf" ,
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

  def receive_note_report 
    @receive_note_report = ReceiveNoteItem.search(params[:search])
    @show_receive_note_report = @receive_note_report.all
    @take_ids = @show_receive_note_report.map(&:id)
  end

  def rn_part_summary_report
    @rn_part_summary_report = ReceiveNoteItem.search(params[:search])
    @show_rn_part_summary_report = @rn_part_summary_report.all
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

