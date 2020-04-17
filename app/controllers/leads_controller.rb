class LeadsController < ApplicationController
  protect_from_forgery
    skip_before_action :verify_authenticity_token

    after_action do 
      lead = Lead.last
      user_name = lead.lead_full_name
      company_name = lead.lead_company_name
      email = lead.lead_email
      phone_number = lead.lead_phone
      department = lead.department_of_service
      project_name = lead.project_name
      project_description = lead.project_description
      message = lead.lead_message
      emailSent(email, user_name, project_name)

      create_ticket(user_name, company_name, email, phone_number, department, project_name, project_description, message)
    end

    def create
    lead = Lead.new

          lead.lead_full_name = params[:Name]
          lead.lead_company_name = params[:Business_name]
          lead.lead_email = params[:Email]
          lead.lead_phone = params[:Phone]
          lead.project_name = params[:Project_name]
          lead.project_description = params[:Subject]
          lead.department_of_service = params[:Department]
          lead.lead_message = params[:Message]
          lead.created_at = Time.now

      lead.save!
      redirect_to "/pages/index_one_page_elevator"
    end
  end
