class LeadsController < ApplicationController
  before_filter CASClient::Frameworks::Rails::Filter
  layout "leads"

  active_scaffold :lead do |config|
    config.search.columns << :updated_at
    # change the heading for list view
    config.label = "Customer Leads"
    # this decides what data to show in the list view
    config.list.columns = [:updated_at,:company_name, :contact, :phone, :city, :state ]
    # change the heading for the update view
    config.update.link.label = "update lead"
    # change what can be updated
    config.update.columns = [ :company_name, 
                              :contact, 
                              :phone, 
                              :email,
                              :city, 
                              :state, 
                              :notes, 
                              :commodities,
                              :operations ]
  end#do 

protected
  ####################
  #before_update_save should get
  #=>
  # and should return
  #=>
  def before_update_save( record )
    record.updated_by = session[:cas_user]
  end
end#class 