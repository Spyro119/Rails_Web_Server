require "SpeechToText"


RSpec.describe MachineLearning::SpeechToText do 
   speechToText = MachineLearning::SpeechToText.new
   describe ".GetToken" do
      context 'Ask for token' do 
         it 'returns a toekn in string' do
            expect(speechToText.GetToken()).to be_kind_of String
         end
      end
   end

   describe ".PostUploadFile" do
      
      context 'upload a file' do 
         it "returns response header message in case of unsuccessfull upload" do 
            expect(speechToText.PostUploadFile()).to be_kind_of String
         end

         it 'returns status of 200' do
            expect(speechToText.PostUploadFile()).to eq('200')
         end
      end
   end
   describe ".STT" do 
      context "sending a voice for transcription" do
         it "returns the text", :focus do
            # expect(speechToText.STT()).to include("Welcome")
            expect(speechToText.STT()).to be_kind_of String
         end
      end
   end
end
