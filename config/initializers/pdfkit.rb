PDFKit.configure do |config|


#'C:\Program Files\wkhtmltopdf\wkhtmltopdf.exe'

  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.root_url = "http://localhost:3000"
  config.default_options = {
    :encoding => "UTF-8",
    :page_size => "A4",
    :margin_top => "0.25in",
    :margin_right => "1in",
    :margin_bottom => "0.25in",
    :margin_left => "1in",
    :disable_smart_shrinking => false
  }

#  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
#  config.root_url = "#http://localhost:3000"
#  config.default_options = {
#    :encoding => "UTF-8",
#    :page_size => "A4",
#    :margin_top => "0.25in",
#    :margin_right => "1in",
#    :margin_bottom => "0.25in",
#    :margin_left => "1in",
#    :disable_smart_shrinking => false
#  }
  
end

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}