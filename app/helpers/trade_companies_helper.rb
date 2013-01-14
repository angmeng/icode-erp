module TradeCompaniesHelper
  
  def fields_for_contact(contact, &block)
    prefix = contact.new_record? ? 'new' : 'existing'
    fields_for("contact[#{prefix}_contact_attributes][]", contact, &block)
  end

#  def add_contact_link(name) 
#    link_to_function name do |page| 
#      page.insert_html :bottom, :contacts, :partial => 'contact', :object => Contact.new 
#    end 
#  end 

end
