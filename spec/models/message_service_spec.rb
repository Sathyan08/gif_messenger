require 'spec_helper'
require './app/models/message_service'

RSpec.describe MessageService do
  describe "#execute" do

    let(:query_string) { "funny cat" }
    let(:phone_number) { "5551234" }

    let(:gif_url) { gif_hash["url"] }
    let(:twilio_spy) { double }
    let(:message_spy) { double }

    let(:modified_phone_number) { "+1" + phone_number }

    before do
      allow(GifUrlService).to receive(:execute).and_return(gif_url)
      allow(described_class).to receive(:twilio_client).and_return(twilio_spy)
      allow(twilio_spy).to receive(:messages).and_return(message_spy)
      allow(message_spy).to receive(:create)
    end

    it "sends the Twilio client the url and the phone number" do
      expect(message_spy).to have_received(:create).with(
                                                          from: ENV['TWILIO_FROM_NUMBER'],
                                                          to: modified_phone_number,
                                                          body: MessageService::DEFAULT_BODY,
                                                          media_url: gif_url
                                                        )
    end
  end
end
