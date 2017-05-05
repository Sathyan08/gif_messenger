class GifUrlService
  def self.find_url(query)
    result = Giphy.search(query, limit: 1).first
    result.fixed_height_downsampled_image.url.to_s
  end
end
