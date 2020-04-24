require 'uri'
require 'net/http'
require 'json'
module ElevatorMedia
    class Streamer 
        def self.getContent(input)
            url = URI.parse(input)
            net = Net::HTTP 
            http = Net::HTTP.new(url.host, url.port)

            if input == ""
                @body = nil
            
            else
            net.start(url.host, url.port)
            req = net::Get.new(url)
            res = net.start(url.host, url.port, :use_ssl => url.scheme == 'https') {|http|
            http.request(req)
            }
            puts "Status : #{res.code} #{res.message}"
            status = res.code
            message = res.message
            @body = res.body.split('<nav id="nav">').first
            end

            if status != "200"
                return {status: status, message: message}
            end
            
            @body
        end

        def self.timeWidget(city)
            @body =  '<a href=' + "https://time.is/#{city}" + ' id="time_is_link" rel="nofollow" style="font-size:36px">Time in ' + "#{city}:" + '</a>
            <span id="Magog_z18a" style="font-size:36px"></span>
            <script src="//widget.time.is/t.js"></script>
            <script>
            time_is_widget.init' + "({#{city}_z18a" + ':{}});
            </script>'
        end
    end
end
