class SpeakerrecognitionController < ApplicationController
    def index
        net = Net::HTTP 
        # http = Net::HTTP.new(uri.host, uri.port)
        uri = URI('https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })
    
        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SpeakerRecognitionSecret']

        # Request body
        request.body = "{body}"
    
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        body = response.body
        puts response.body
        render json: body
    end
    def show 
        net = Net::HTTP 
        # http = Net::HTTP.new(uri.host, uri.port)
        uri = URI("https://westus.api.cognitive.microsoft.com/spid/v1.0/identificationProfiles/")
        uri.query = URI.encode_www_form({
        })
    
        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '94d93216471d43d29e40ba8585bd2bef'
        # Request body
        request.body = "{body}"
    
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        body = response.body
        puts response.body
        render json: body
    end
end
