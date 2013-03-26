class Report < ActiveRecord::Base
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |p|
        csv << p.attributes.values_at(*column_names)
      end
    end
  end

  def self.testing
  	html = render_to_string(:layout => false , :action => "pdf_do_so_documentation_report.html.erb")
        @kit = PDFKit.new(html)
        send_data(@kit.to_pdf,  :filename => "pdf_delivery_order_report.pdf",
                                :type => 'application/pdf' ,
                                :disposition => "attachement" )
    end

  
end

