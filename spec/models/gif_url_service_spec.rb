require 'spec_helper'
require './app/models/gif_url_service'

RSpec.describe GifUrlService do
  describe "#execute" do
    let(:gif_hash) do
      {
        "type"=>"gif",
        "id"=>"JIX9t2j0ZTN9S",
        "slug"=>"JIX9t2j0ZTN9S",
        "url"=>"http://giphy.com/gifs/JIX9t2j0ZTN9S",
        "bitly_gif_url"=>"http://gph.is/1LjlEFE",
        "bitly_url"=>"http://gph.is/1LjlEFE",
        "embed_url"=>"http://giphy.com/embed/JIX9t2j0ZTN9S",
        "username"=>"",
        "source"=>"http://www.reddit.com/r/reactiongifs/comments/3a8akf/my_cats_reaction_when_i_leave_home/",
        "rating"=>"g",
        "content_url"=>"",
        "source_tld"=>"www.reddit.com",
        "source_post_url"=>"http://www.reddit.com/r/reactiongifs/comments/3a8akf/my_cats_reaction_when_i_leave_home/",
        "is_indexable"=>0,
        "import_datetime"=>"2015-06-18 00:42:05",
        "trending_datetime"=>"2017-03-11 12:45:01",
        "images"=>
         {"fixed_height"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200.gif",
            "width"=>"200",
            "height"=>"200",
            "size"=>"632576",
            "mp4"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200.mp4",
            "mp4_size"=>"17842",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200.webp",
            "webp_size"=>"158680"},
          "fixed_height_still"=>{"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200_s.gif", "width"=>"200", "height"=>"200"},
          "fixed_height_downsampled"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200_d.gif",
            "width"=>"200",
            "height"=>"200",
            "size"=>"163461",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200_d.webp",
            "webp_size"=>"46454"},
          "fixed_width"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w.gif",
            "width"=>"200",
            "height"=>"200",
            "size"=>"632576",
            "mp4"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w.mp4",
            "mp4_size"=>"17842",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w.webp",
            "webp_size"=>"158680"},
          "fixed_width_still"=>{"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w_s.gif", "width"=>"200", "height"=>"200"},
          "fixed_width_downsampled"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w_d.gif",
            "width"=>"200",
            "height"=>"200",
            "size"=>"163461",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/200w_d.webp",
            "webp_size"=>"46454"},
          "fixed_height_small"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100.gif",
            "width"=>"100",
            "height"=>"100",
            "size"=>"205745",
            "mp4"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100.mp4",
            "mp4_size"=>"8988",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100.webp",
            "webp_size"=>"65708"},
          "fixed_height_small_still"=>{"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100_s.gif", "width"=>"100", "height"=>"100"},
          "fixed_width_small"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100w.gif",
            "width"=>"100",
            "height"=>"100",
            "size"=>"205745",
            "mp4"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100w.mp4",
            "mp4_size"=>"8988",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100w.webp",
            "webp_size"=>"65708"},
          "fixed_width_small_still"=>{"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/100w_s.gif", "width"=>"100", "height"=>"100"},
          "downsized"=>
           {"url"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized.gif",
            "width"=>"250",
            "height"=>"250",
            "size"=>"982690"},
          "downsized_still"=>
           {"url"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized_s.gif",
            "width"=>"250",
            "height"=>"250",
            "size"=>"40785"},
          "downsized_large"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif", "width"=>"720", "height"=>"720", "size"=>"7712339"},
          "downsized_medium"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized-medium.gif",
            "width"=>"576",
            "height"=>"576",
            "size"=>"4807852"},
          "original"=>
           {"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif",
            "width"=>"720",
            "height"=>"720",
            "size"=>"7712339",
            "frames"=>"25",
            "mp4"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy.mp4",
            "mp4_size"=>"52042",
            "webp"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy.webp",
            "webp_size"=>"1427374"},
          "original_still"=>{"url"=>"http://media3.giphy.com/media/JIX9t2j0ZTN9S/giphy_s.gif", "width"=>"720", "height"=>"720"},
          "looping"=>{"mp4"=>"http://media.giphy.com/media/JIX9t2j0ZTN9S/giphy-loop.mp4"},
          "original_mp4"=>
           {"mp4"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy.mp4", "mp4_size"=>"52042", "width"=>"480", "height"=>"480"},
          "preview"=>
           {"mp4"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.mp4",
            "mp4_size"=>"37518",
            "width"=>"378",
            "height"=>"378"},
          "downsized_small"=>
           {"mp4"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-downsized-small.mp4",
            "mp4_size"=>"179594",
            "width"=>"720",
            "height"=>"720"},
          "preview_gif"=>
           {"url"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.gif", "width"=>"92", "height"=>"92", "size"=>"49760"},
          "480w_still"=>
           {"url"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/480w_s.jpg", "width"=>"480", "height"=>"480", "size"=>"19581"},
          "preview_webp"=>
           {"url"=>"http://media2.giphy.com/media/JIX9t2j0ZTN9S/giphy-preview.webp",
            "width"=>"166",
            "height"=>"166",
            "size"=>"49956"}
          }
        }
    end

    let(:gif) { Giphy::Gif.new(gif_hash) }
    let(:gif_url) { gif_hash["images"]["fixed_height_downsampled"]["url"] }

    let(:result) { [gif] }
    let(:query_string) { "funny cat" }

    before do
      allow(Giphy).to receive(:search).and_return(result)
    end

    it "returns a url string for the first gif in the search results" do
      expect(described_class.find_url(query_string)).to eq(gif_url)
    end
  end
end
