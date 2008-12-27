class LeadsController < ApplicationController
  layout "leads"
  active_scaffold :lead do |config|
    config.theme = :blue
    # change the heading for list view
    config.label = "Customer Leads"
    # this decides what data to show in the list view
    config.list.columns = [:updated_at,:company_name, :contact, :phone, :city, :state ]
    # change the heading for the update view
    config.update.link.label = "update lead"
  end
end

