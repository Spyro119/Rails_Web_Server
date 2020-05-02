require 'pry-byebug'
require 'net/http'
require 'uri'


module MachineLearning
   class SpeechToText
      def GetToken
         uri = URI('https://eastus.api.cognitive.microsoft.com/sts/v1.0/issuetoken')
         uri.query = URI.encode_www_form({
         })

         request = Net::HTTP::Post.new(uri.request_uri)
         # Request headers
         request['Ocp-Apim-Subscription-Key'] = ENV['subscription_key']
         # Request body
         # request.body = "{body}"

         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
         end
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="
         puts response.body
         response.body
      end


      def STT

         # Audio file to be trinscribed: path and name:
         pathName = "/Users/codeboxx/Documents/playground/Azure_speech/voices/"
         fileName = "conv69-ElevatorSmallTalk.wav"
         File.open("#{pathName}#{fileName}") do |aFile|
            @file_data = "#{aFile.read}"
         end
         # source code from : https://eastus.dev.cognitive.microsoft.com/docs/services/speech-to-text-api-v2-0/operations/CreateTranscription
         # the follwoing url is from Speech Studio

         url = URI("https://eastus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?cid=9d218f5c-5e15-47c3-9442-85b30366f7b6")

         https = Net::HTTP.new(url.host, url.port);
         https.use_ssl = true
         # Request preparation

         request = Net::HTTP::Post.new(url)
         # request Header
         request["Ocp-Apim-Subscription-Key"] = ENV['subscription keyS0']
         request["Content-Type"] = "audio/wave"
         # Request body
         request.body = @file_data
         
         response = https.request(request)
         puts response.read_body
         
         parsed_json = ActiveSupport::JSON.decode(response.body) 
         extracted_text = parsed_json['DisplayText']
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="
         puts extracted_text
         extracted_text
      end
   end
end