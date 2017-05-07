require 'spec_helper'
require './app/models/gif_url_service'

RSpec.describe GifUrlService do
  describe "#find_url" do

    let(:large_gifs) { build_list(:large_gif, 24) }
    let(:small_gif) { build(:small_gif) }
    let(:gifs) { large_gifs + [small_gif] }

    let(:query_string) { "funny cat" }
    let(:small_gif_url) { URI.join(described_class::GIPHY_CDN_ROOT_PATH, "#{small_gif.id}.gif")}

    before do
      allow(Giphy).to receive(:search).and_return(gifs)
    end

    it "returns a url string for the first gif small enough to send over Twilio" do
      expect(described_class.find_url(query_string)).to eq(small_gif_url)
    end
  end
end
