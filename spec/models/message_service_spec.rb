require 'spec_helper'
require './app/models/message_service'

RSpec.describe MessageService do
  describe "#deliver" do

    let(:query_string) { "funny cat" }
    let(:phone_number) { "5551234" }

    let(:gif_id)  { "JIX9t2j0ZTN9S" }
    let(:gif_url) { URI.join(GifUrlService::GIPHY_CDN_ROOT_PATH, "#{gif_id}.gif") }

    let(:twilio_spy) { double }
    let(:message_spy) { double }

    let(:modified_phone_number) { "+1" + phone_number }

    before do
      allow(GifUrlService).to receive(:find_url).and_return(gif_url)
      allow_any_instance_of(described_class).to receive(:twilio_client).and_return(twilio_spy)

      allow(twilio_spy).to receive(:messages).and_return(message_spy)
      allow(message_spy).to receive(:create)

      described_class.deliver(query: query_string, phone_number: phone_number)
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
