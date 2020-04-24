require 'sendgrid-ruby'
require './config/application'
# include SendGrid


def emailSent(email, name, project_name)
    mail = SendGrid::Mail.new()
    # puts mail.to_json
    mail.from = SendGrid::Email.new(email: 'rocketelevators@gmail.com')
    to = SendGrid::Email.new(email: email)
    mail.subject = 'Thank you for contacting us'
    
    mail.template_id = 'd-7b970e363ebd43e189f8e7a595e1bec2'
    personalization = SendGrid::Personalization.new
    personalization.add_to(SendGrid::Email.new(email: email))
    personalization.add_dynamic_template_data(name: name)
    personalization.add_dynamic_template_data(project_name: project_name)

      mail.add_personalization(personalization)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
    return {status: response.status_code}
end