require 'rails_helper'

RSpec.describe SpeakerrecognitionController, type: :controller do 
    context 'Testing the controller ' do
        it 'should return 200 Okay' do
            expect(response.status).to eq(200)
            # expect(response).to have_http_status(:get_all_profiles)
        # expect(index()).to be_an_instance_of(String)
        end
    end    
end