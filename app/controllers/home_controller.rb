class HomeController < ApplicationController
  before_filter :ste_expire_date
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
  end
  
  private
  def ste_expire_date
    if company.check_expire_date > Date.today
      @ste = SalesTaxExemption.where(:valid_date_condition => true)
      if @ste
        @ste.each do |ste|
          ste.update_attributes!(:valid_date_condition => false) if ste.period_end.strftime("%d-%m-%Y") > Date.today.strftime("%d-%m-%Y")
        end
        company.update_attributes!(:check_expire_date => Date.today)
      end
    end
  end
end