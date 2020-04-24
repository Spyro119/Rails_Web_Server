require 'Sendgrid'

RSpec.describe 'Sendgrid mailer' do
subject {SendGrid::Mail.new()} 
    context 'Initialize connection' do
        it 'returns object' do
            expect(SendGrid::Mail.new()).to be_a(Object)
        end
    end
    describe '.emailSent()' do
        context 'Sending email from inputs' do
            it 'Returns a string' do
                expect(emailSent("SamuelJubinvile119@gmail.com","Sam", "Projet")).to eq(:status => "202")
            end
        end
    end
end