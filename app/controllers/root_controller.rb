    require 'net/http'
    require "uri"
    require "json"
    require "ibm_watson"
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
    include IBMWatson
class RootController < ApplicationController
    before_action :info
    def info

        current_employee = "Admin user"
        current_number_elevator = Elevator.count

        i = Elevator.where(:elevator_status =>"inactive")
        int = Elevator.where(:elevator_status =>"Intervention")
        number_elevator_not_in_services = i.count + int.count

        number_of_customer = Customer.count

        number_of_building = Building.count

        a = Address.where(:entity_type => "building")
        how_much_city = a.count

        quote = Quote.count

        lead = Lead.count

        batterie_deploy = Battery.count

        good_text = 
        "Hi #{current_employee}. 
        There are currently #{current_number_elevator} elevators deployed in #{number_of_building} buildings of #{number_of_customer}
        customers. 
        Currently, #{number_elevator_not_in_services} elevators are not in Running Status and are being serviced. 
        You currently have #{quote} quotes awaiting processing. 
        You currently have #{lead} leads in your contact requests.
        #{batterie_deploy} Batteries are deployed across #{how_much_city} cities"
        puts good_text
        


        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: ENV["IBM_WATSON_API_KEY"]
        )
        text_to_speech = IBMWatson::TextToSpeechV1.new(
            authenticator: authenticator
        )
        text_to_speech.service_url = ENV["IBM_WATSON_URL"]
        
        tmp_file = "#{Rails.root}/public/real.wav"
        File.open(tmp_file, "wb") do |audio_file|
            response = text_to_speech.synthesize(
            text: good_text ,
            accept: "audio/wav",
            voice: "en-US_AllisonVoice"
            ).result
            audio_file << response
        end
        redirect_to "/admin/root"
    end 
end

           