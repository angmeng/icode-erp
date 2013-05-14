class ReportsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :except => [:company_report , :credit_note_report , :customer_report , :debit_repot, 
  :do_so_documentation_report, :do_summary_report , :inventory_report , :purchase_order_report , :pr_report,
  :price_report , :product_report , :purchase_by_creditor_report ,:rn_part_summary_report,
  :rn_report , :sales_cj5_summary_co_report , :sales_tax_exemption_report ,
  :so_customer_po_detail_report , :so_listing_report , :so_summary_report , 
  :po_listing_vendor_report , :debit_note_report , :receive_note_report , 
  :journal_sales_report , :receipt_report]

  def excel_so_customer_po_detail_report
    if params[:so_ids].present?
      #render :text => params[:search]
      @excel_so_customer_po_detail_report = SalesOrderItem.find(params[:so_ids])
        respond_to do |format|
          format.html
          format.csv {render text: @excel_so_customer_po_detail_report.to_csv}
          format.xls
        end
      else
        redirect_to so_customer_po_detail_report_reports_path
      end
  end

  def excel_sales_order_summary_report
    if params[:sos_ids].present?
      @excel_sales_order_summary_report = SalesOrderItem.find(params[:sos_ids])
      respond_to do |format|
        format.html
        format.csv {render text: @excel_sales_order_summary_report.to_csv}
        format.xls
      end
    else
      redirect_to sales_order_summary_report_reports_path
    end
  end

  def excel_product_report
    #if params[:commit] == "Excel"
    if params[:pro_ids].present?
      @excel_product_report = ProductCombobox.find(params[:pro_ids])
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
    if params[:in_ids].present?
      @excel_inventory_report = InventoryHistory.find(params[:in_ids])
      respond_to do |format|
        format.html
        format.csv{ render text: @excel_inventory_report.to_csv }
        format.xls
    end
  else
    redirect_to inventory_report_reports_path
  end
end

def excel_pr_report # link from pdf_pr_report
  if params[:pr_ids].present?
    @excel_pr_report = PurchaseRequisition.find(params[:pr_ids])
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
    @excel_po_report = PurchaseOrder.find(params[:po_ids])
    respond_to do |format|
      format.html
      format.csv {render text: @excel_po_report.to_csv }
      format.xls
    end
  else
    redirect_to po_report_reports_path
  end
end

def excel_sales_tax_exemption_report
  if params[:ste_ids].present?
    @excel_sales_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
    respond_to do |format|
      format.html
      format.csv {render text: @excel_sales_tax_exemption_report.to_csv }
      format.xls
    end
  else
    redirect_to sales_tax_exemption_report_reports_path
  end
end

def excel_receive_note_report
  if params[:rn_ids].present?
    @excel_receive_note_report = ReceiveNote.find(params[:rn_ids])
    respond_to do |format|
      format.html
      format.csv {render text: @excel_receive_note_report.to_csv }
      format.xls
    end
  else
    redirect_to receive_note_report_reports_path
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


def pdf_pr_report
#render :text => params[:pr_ids].to_json
  if params[:commit] == "PDF Report"
    if params[:pr_ids].present?
      @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
      html = render_to_string(:layout => false , :action => "pdf_pr_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_pr_report.pdf", 
                                  :type => 'application/pdf' , 
                                  :disposition => "attachement" )
        #return # to avoid double render call
    end
    elsif params[:commit] == "Show"
      if params[:pr_ids].present?
      @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
        respond_to do |format|
          format.html
        end
      end 
      #render :text => "this is show function"
    elsif params[:commit] == "Excel Report"
      if params[:pr_ids].present?
        redirect_to excel_pr_report_reports_path(:pr_ids => params[:pr_ids] , :format => "xls")   #render to controller excel_pr_report
      end
    else
      redirect_to pr_report_reports_path
  end
    
end

def pdf_po_listing_vendor_report
  if params[:commit] == "PDF Report"
     if params[:po_ids].present?
      @detail_po_listing_vendor_report = PurchaseOrder.find(params[:po_ids])
      html = render_to_string(:layout => false , :action => "pdf_po_listing_vendor_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_po_listing_vendor_report.pdf" ,
                                 :type => 'application/pdf' ,
                                 :disposition => "attachement" )
    end
    elsif params[:commit] == "Show"
      if params[:po_ids].present?
      @detail_po_listing_vendor_report = PurchaseOrder.find(params[:po_ids])
      respond_to do |format|
        format.html
      end
    end
    elsif params[:commit] == "Excel Report"
      if params[:po_ids].present?
        redirect_to excel_po_report_reports_path(:po_ids => params[:po_ids] , :format => "xls")
    end
    else
    redirect_to po_report_reports_path
  end
end



def pdf_product_report
  #render :text => params[:pri_ids]
  if params[:commit] == "PDF Report"
    if params[:pro_ids].present?
      @detail_product_report = ProductCombobox.find(params[:pro_ids])
      html = render_to_string(:layout => false , :action => "pdf_product_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_product_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
      end
      #manage_categories(params[:category_id])
    elsif params[:commit] == "Show"
      if params[:pro_ids].present?
        @detail_product_report = ProductCombobox.find(params[:pro_ids])
        respond_to do |format|
          format.html
        end
      end
    elsif params[:commit] == "Excel Report"
      if params[:pro_ids].present?
        redirect_to excel_product_report_reports_path(:pro_ids => params[:pro_ids] , :format => "xls")    
    end
  else
    redirect_to product_report_reports_path
  end
end



def pdf_inventory_report 
    if params[:commit] == "PDF Report"
      if params[:in_ids].present?
        @detail_inventory_report = InventoryHistory.find(params[:in_ids])
        html = render_to_string(:layout => false , :action => "pdf_inventory_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf , :filename => "pdf_inventory_report.pdf" ,
                                :type => 'application/pdf', 
                                :disposition => "attachement")
      end
    elsif params[:commit] == "Show"
      if params[:in_ids].present?
        @detail_inventory_report = InventoryHistory.find(params[:in_ids])
        respond_to do |format|
          format.html
        end
      end
    elsif params[:commit] == "Excel Report"
      if params[:in_ids].present?
        redirect_to excel_inventory_report_reports_path(:in_ids => params[:in_ids] , :format => "xls")
      end
    else
      redirect_to inventory_report_reports_path      
    end
end
     

def pdf_sales_tax_exemption_report
  if params[:commit] == "PDF Report"
    if params[:ste_ids].present?
    @detail_sales_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
    html = render_to_string(:layout => false , :action => "pdf_sales_tax_exemption_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf ,:filename => "pdf_sales_tax_exemption_report.pdf" ,
                              :type => 'application/pdf' , 
                              :disposition => "attachement" )
     
    end
  # elsif params[:commit] == "Print Invoice"
  #   if params[:ste_ids].present?
  #     @detail_invoice_report = SalesTaxExemption.find(params[:ste_ids])
  #     respond_to do |format|
  #       format.html
  #     # html = render_to_string(:layout => false , :action => "pdf_invoice_report.html.erb")
  #     #   @kit = PDFKit.new(html)
  #     #   send_data(@kit.to_pdf , :filename => "pdf_invoice_report.pdf" ,
  #     #                           :type => 'application/pdf',
  #     #                           :disposition => "attachement" )
  #   end
  # end
    elsif params[:commit] == "Show"
      if params[:ste_ids].present?
        @detail_sales_tax_exemption_report = SalesTaxExemption.find(params[:ste_ids])
        respond_to do |format|
          format.html
      end
    end
  elsif params[:commit] == "Excel Report"
    if params[:ste_ids].present?
      redirect_to excel_sales_tax_exemption_report_reports_path(:ste_ids => params[:ste_ids] , :format => "xls")
    end
    else
       redirect_to sales_tax_exemption_report_reports_path
    end
end


def pdf_receive_note_report
  if params[:commit] == "PDF Report"
    if params[:rn_ids].present?
      @detail_receive_note_report = ReceiveNoteItem.find(params[:rn_ids])
      html = render_to_string(:layout => false , :action => "pdf_receive_note_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_receive_note_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement" )
        end
    elsif params[:commit] == "Show"
      if params[:rn_ids].present?
        @detail_receive_note_report = ReceiveNoteItem.find(params[:rn_ids])
        respond_to do |format|
          format.html
      end
    end
  elsif params[:commit] == "Excel Report"
    if params[:rn_ids].present?
      redirect_to excel_receive_note_report_reports_path(:rn_ids => params[:rn_ids] , :format => "xls")
    end
    else
      redirect_to receive_note_report_reports_path
    end
end 

  def pdf_sales_order_summary_report
    if params[:commit] == "PDF Report"
      if params[:sos_ids].present?
        @detail_sales_order_summary_report = SalesOrder.find(params[:sos_ids])
        html = render_to_string(:layout => false , :action => "pdf_sales_order_summary_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_sales_order_summary_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement")
        end
      elsif params[:commit] == "Show"
        if params[:sos_ids].present?
          @detail_sales_order_summary_report =  SalesOrder.find(params[:sos_ids])
          respond_to do |format|
            format.html
        end
      end
    elsif params[:commit] == "Excel Report"
      if params[:sos_ids].present?
        redirect_to excel_sales_order_summary_report_reports_path(:sos_ids => params[:sos_ids] , :format => "xls")
      end
    else
      redirect_to sales_order_summary_report_reports_path
      end      
  end

  def pdf_so_customer_po_detail_report
    if params[:commit] == "PDF Report"
      if params[:so_ids].present?
        @detail_so_customer_po_detail_report = SalesOrder.find(params[:so_ids])
        html = render_to_string(:layout => false , :action => "pdf_so_customer_po_detail_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_so_customer_po_detail_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement")
        end
      elsif params[:commit] == "Show"
        if params[:so_ids].present?
          @detail_so_customer_po_detail_report =  SalesOrder.find(params[:so_ids])
          respond_to do |format|
            format.html
        end
      end
    elsif params[:commit] == "Excel Report"
      if params[:so_ids].present?
        redirect_to excel_so_customer_po_detail_report_reports_path(:so_ids => params[:so_ids] , :format => "xls")
      end
    else
      redirect_to so_customer_po_detail_report_reports_path
      end  
  end

  def pdf_do_so_documentation_report
    if params[:commit] == "Print D/O"
       if params[:doc_ids].present?
       @detail_delivery_order_documentation_report = DeliveryOrder.find(params[:doc_ids])
       html = render_to_string(:layout => false , :action => "pdf_do_so_documentation_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf,  :filename => "pdf_delivery_order_report.pdf",
                                :type => 'application/pdf' ,
                                :disposition => "attachement" )
      end
    elsif params[:commit] == "Print Invoice"
      if params[:doc_ids].present?

        Report.pdf_do_so_documentation_report(params[:doc_ids])
        @detail_invoice_documentation_report = DeliveryOrder.find(params[:doc_ids])
        
        html = render_to_string(:layout => false , :action => "pdf_do_so_documentation_report.html.erb")
         @kit = PDFKit.new(html , :page_size => 'Letter')
         send_data(@kit.to_pdf,  :filename => "pdf_invoice_report.pdf",
                                 :type => 'application/pdf' ,
                                 :disposition => "attachement" )


        #a = DeliveryOrder.find(params[:doc_ids].first)
        # a = DeliveryOrder.find(params[:doc_ids])
        # if a.authorize_print == false
        # redirect_to do_so_documentation_report_reports_path, notice: 'Please get an authorize from supervisor'
        # elsif a.authorize_print == 1
        
       #@detail_invoice_documentation_report = DeliveryOrder.find(params[:doc_ids].first) 
        # a.authorize_print = false
        # a.save!
      # generate_history
        

       

        end 
      else
      redirect_to do_so_documentation_report_reports_path
    end
  end

  def pdf_delivery_order_summary_report
    if params[:commit] == "PDF Report"
      if params[:doc_ids].present?
        @detail_delivery_order_summary_report = DeliveryOrder.find(params[:doc_ids])
        html = render_to_string(:layout => false , :action => "pdf_delivery_order_summary_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_delivery_order_summary_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement")
        end
      elsif params[:commit] == "Show"
        if params[:doc_ids].present?
          @detail_delivery_order_summary_report =  DeliveryOrder.find(params[:doc_ids])
          respond_to do |format|
            format.html
        end
      end
    elsif params[:commit] == "Excel Report"
      # if params[:so_ids].present?
      #   redirect_to excel_so_customer_po_detail_report_reports_path(:so_ids => params[:so_ids] , :format => "xls")
      # end
    else
      redirect_to so_customer_po_detail_report_reports_path
      end 
  end

  def pdf_sales_order_listing_report
    if params[:commit] == "PDF Report"
      if params[:sol_ids].present?
        @detail_sales_order_listing_report = SalesOrder.find(params[:sol_ids])
        html = render_to_string(:layout => false , :action => "pdf_sales_order_listing_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_sales_order_listing_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement")
        end
      elsif params[:commit] == "Show"
        if params[:sol_ids].present?
          @detail_sales_order_listing_report =  SalesOrder.find(params[:sol_ids])
          respond_to do |format|
            format.html
          end
      end
    elsif params[:commit] == "Excel Report"
      # if params[:so_ids].present?
      #   redirect_to excel_so_customer_po_detail_report_reports_path(:so_ids => params[:so_ids] , :format => "xls")
      # end
    else
      redirect_to so_customer_po_detail_report_reports_path
    end 
  end

  def pdf_purchase_order_report
    if params[:commit] == "PDF Report"
      if params[:pp_ids].present?
        @detail_purchase_order_report = PurchaseOrder.find(params[:pp_ids])
        html = render_to_string(:layout => false , :action => "pdf_purchase_order_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "pdf_purchase_order_report.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement")
        end
        # render :text => params[:pp_ids].to_json
      elsif params[:commit] == "Show"
        if params[:pp_ids].present?
          @detail_purchase_order_report =  PurchaseOrder.find(params[:pp_ids])
          respond_to do |format|
            format.html
        end
      end
    else 
      redirect_to purchase_order_report_reports_path
    end
  end

  def pdf_credit_note_report
    if params[:commit] == "PDF Report"
      if params[:cn_ids].present?
        @detail_credit_note_report = CreditNote.find(params[:cn_ids])
        html = render_to_string(:layout => false , :action => "pdf_credit_note_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf , :filename => "pdf_credit_note_report.pdf",
                                  :type => 'application/pdf' ,
                                  :disposition => "attachement")
        end
      elsif params[:commit] == "Show"
        if params[:cn_ids].present?
          @detail_credit_note_report = CreditNote.find(params[:cn_ids])
          respond_to do |format|
            format.html
        end
      end
      else
        redirect_to credit_note_report_reports_path
      end 
  end

  def pdf_debit_note_report
    if params[:commit] == "PDF Report"
     if params[:dn_ids].present?
        @detail_dedit_note_report = DebitNote.find(params[:dn_ids])
        html = render_to_string(:layout => false , :action => "pdf_debit_note_report.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf , :filename => "pdf_debit_note_report.pdf",
                                  :type => 'application/pdf' ,
                                  :disposition => "attachement")
        end
    elsif params[:commit] == "Show"
       if params[:dn_ids].present?
          @detail_debit_note_report = DebitNote.find(params[:dn_ids])
          respond_to do |format|
            format.html
        end
      end
    else
        redirect_to dedit_note_report_reports_path
    end 
  end

    def pdf_journal_sales_report
      if params[:commit] == "PDF Report"
       if params[:js_ids].present?
          @detail_journal_sales_report = JournalVoucher.find(params[:js_ids])
          html = render_to_string(:layout => false , :action => "pdf_journal_sales_report.html.erb")
            @kit = PDFKit.new(html)
            send_data(@kit.to_pdf , :filename => "pdf_journal_sales_report.pdf",
                                    :type => 'application/pdf' ,
                                    :disposition => "attachement",
                                    :page_size => "A3")
          end
      elsif params[:commit] == "Show"
         if params[:js_ids].present?
            @detail_journal_sales_report = JournalVoucher.find(params[:js_ids])
            respond_to do |format|
              format.html
          end
        end
      else
          redirect_to journal_sales_report_reports_path
      end
    end

    def pdf_receipt_report

      #render :text => params[:sta_ids].to_json
      if params[:commit] == "PDF Report"
        if params[:rec_ids].present?
          @detail_receipt_report = Receipt.find(params[:rec_ids])
          html = render_to_string(:layout => false , :action => "pdf_receipt_report_html.erb")
            @kit = PDFKit.new(html)
            send_data(@kit.to_pdf , :filename => "pdf_receipt_report.pdf",
                                    :type => 'application/pdf' ,
                                    :disposition => "attachement")
        end
        elsif params[:commit] == "Show"
         if params[:rec_ids].present?
            @detail_receipt_report = Receipt.find(params[:rec_ids])
            respond_to do |format|
              format.html
          end
        end
      else
          redirect_to receipt_report_reports_path
      end

    end



  # ======================================= end of pdf ============================================

  # def pdf_purchase_by_creditor_report
  #   if params[:purchase_ids].present?
  #     @detail_purchase_by_creditor_report = PurchaseRequisitionItem.find(params[:search])
  #     repond_to do |format|
  #       format.html
  #       format.json {render json: @detail_purchase_by_creditor_report }
  #       format.pdf {
  #       @kit = PDFKit.new(html)
  #       send_data(@kit.to_pdf ,:filename => "pdf_purchase_by_creditor_report.pdf" ,
  #                             :type => 'application/pdf' , 
  #                             :disposition => "attachement" )
  #       }
  #     end
  #   elsif params[:commit] == "Excel Report"
  #     if params[:purchase_ids].present?
  #     redirect_to excel_purchase_by_creditor_report_reports_path(:purchase_ids => params[:purchase_ids] , :format => "xls")
  #   end
  #   else 
  #     redirect_to purchase_by_creditor_report_reports_path
  #   end
  # end

  def purchase_by_creditor_report
    @purchase_by_creditor = PurchaseRequisitionItem.search(params[:search])
    @show_purchase_by_creditor = @purchase_by_creditor.all
    
  end 
  
  def product_report
    @product_report = ProductCombobox.search(params[:search])
    @show_product_report = @product_report.all
     respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
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

  def customer_report
    @product_customer_report = ProductCustomer.search(params[:search])
    @show_product_customer_report = @product_customer_report.all
  end

  def sales_tax_exemption_report
    @sales_tax_exemption_report = SalesTaxExemption.search(params[:search])
    @show_sales_tax_exemption_report = @sales_tax_exemption_report.all
    #@take_ids = @show_sale_tax_exemption_report.map(&:id)
  end

  def sales_cj5_summary_co_report
    @sales_cj5_summary_co = SalesTaxExemptionBarang.search(params[:search])
    @show_sales_cj5_summary_co_report = @sales_cj5_summary_co.all
  end

  def price_report
    @price_report = PriceControlItem.search(params[:search])
    @show_price_report = @price_report.all
  end 
 
 
  def inventory_report
    @inventory_report = InventoryHistory.search(params[:search])
    @show_inventory_report = @inventory_report.all
    respond_to do |format|
      format.html
      format.json { render json: ProductsDatatable.new(view_context) }
    end
    #@take_ids = @show_inventory_report.map(&:id)
  end

  # def delivery_order
  #   @delivery_order_report = DeliveryOrderItem.search(params[:search])
  #   @show_delivery_order_report = @delivery_order_report.all
  # end

  def so_summary_report
    @sales_order_summary_report = SalesOrderItem.search(params[:search])
    @show_sales_order_summary_report = @sales_order_summary_report.all
  end

  def so_customer_po_detail_report
    @so_customer_po_detail_report = SalesOrder.search(params[:search])
    @show_so_customer_po_detail_report = @so_customer_po_detail_report.all
  end

  def do_so_documentation_report
    @do_so_documentation_report = DeliveryOrder.search(params[:search])
    @show_do_so_documentation_report = @do_so_documentation_report.all
    # where(:authorize_print => true)

  end

  def do_summary_report
    @do_summary_report = DeliveryOrder.search(params[:search])
    @show_delivery_order_summary_report = @do_summary_report.all
  end

  def so_listing_report
    @sales_order_listing_report = SalesOrder.search(params[:search])
    @show_sales_order_listing_report = @sales_order_listing_report.all
  end

  def debit_note_report
    @debit_note_report = DebitNote.search(params[:search])
    @show_debit_note_report = @debit_note_report.all
  end 

  def credit_note_report
    @credit_note_report = CreditNote.search(params[:search])
    @show_credit_note_report = @credit_note_report.all
  end

  def purchase_order_report
    @purchase_order_report = PurchaseOrder.search(params[:search])
    @show_purchase_order_report = @purchase_order_report.all
  end

  def po_listing_vendor_report
    @po_listing_vendor_report = PurchaseOrder.search(params[:search])
    @show_po_listing_vendor_report = @po_listing_vendor_report.all
    #@take_ids = @show_po_report.map(&:id) #for pdf 
  end

  def receipt_report
    @receipt_report = Receipt.search(params[:search])
    @show_receipt_report = @receipt_report.all
  end

  def journal_sales_report
    @journal_sales_report = JournalVoucher.search(params[:search])
    @show_journal_sales_report = @journal_sales_report.all
  end




 
end   

#private
  
 # def manage_categories(cat_id)
 #   @category_id = cat_id
 #   @listing_categories = ProductCategory.find(@category_id) if @category_id.present?
 #   @field_id = ProductCategory.all_field_id(@listing_categories) if @listing_categories.present?
 #   @show_product = @listing_categories.product if @listing_categories.present?
 # end

 # private

 #  def acion_button(doc_ids)
 #    @temporary_id = doc_ids
 #    if @temporary_id == 
 #      alert("abc")
 #    else
 #        scope :non_operation_kiv, where
 #        ("category_type = ? and status = ?", 
 #          ProductCategory::NON_OPERATION, ProductCategory::KEEP_IN_VIEW)

 #    end 
 #  end 

