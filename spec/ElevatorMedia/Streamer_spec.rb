require 'Streamer'

RSpec.describe ElevatorMedia::Streamer do
    describe '.getContent' do 
        #Fetches the whole body of a page. Need to substring
        context 'test for an empty string' do 
            it 'returns zero' do
                expect(ElevatorMedia::Streamer.getContent('')).to eq(message: nil, status: nil)
            end
        end
        context 'If error return ' do 
            it 'returns 404 error' do 
                expect(ElevatorMedia::Streamer.getContent('http://www.google.ca/s')).to eq(status: "400", message: "Bad Request")
            end
        end
        context 'Accesssing time using HTTPS' do 
            it 'returns HTML string' do
                expect(ElevatorMedia::Streamer.getContent("https://time.is/just/")).to be_an_instance_of(String)
            end
        end
        context 'Accesssing time using HTTPS' do 
            it 'returns HTML string including City "Japan" ' do
                city = 'Japan'
                expect(ElevatorMedia::Streamer.getContent("https://time.is/just/#{city}")).to include("Japan")
            end
        end
        context ' Spotifiy website ' do
            it 'returns HTML string ' do
                #Do not work as intended q
                expect(ElevatorMedia::Streamer.getContent('https://open.spotify.com/artist/1XpDYCrUJnvCo9Ez6yeMWh?si=WCgfJB3kTG2hrLhnfo0-6Q')).to be_an_instance_of(String)
            end
        end
    end
end
