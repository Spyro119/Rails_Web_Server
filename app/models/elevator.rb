
require 'twilio-ruby'
require 'http'
require 'json'


class Elevator < ApplicationRecord
    
    belongs_to :column

    attr_reader :message

    # after_save :notify_twilio
    
    private

    def notify_twilio

        if elevator_status == "Intervention" or elevator_status == "intervention"
            client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
            client.messages.create({
              from: '+12058467272',
              to: '+15819831152',
              body: "The Elevator " + id.to_s + " with Serial Number " + elevator_serial_number.to_s + " changed status from " + elevator_status_before_last_save + " to " + elevator_status
            })
        end
    end

    # after_save :notify_slack
    
    private

    def notify_slack

        @old_status = elevator_status_before_last_save
        puts elevator_status_before_last_save
        puts "----------------------------------"
        puts elevator_status
        puts "----------------------------------"
        
        if elevator_status != @old_status
            text_to_send = "The Elevator " + id.to_s + " with Serial Number " + elevator_serial_number.to_s + " changed status from " + elevator_status_before_last_save + " to " + elevator_status
            rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
            token: ENV['SLACK_API_TOKEN'],
            channel: '#elevator_operations',
            text: text_to_send,
            as_user: true
            })
            puts JSON.pretty_generate(JSON.parse(rc.body))
        end
    end

end
