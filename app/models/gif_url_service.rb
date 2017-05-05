class GifUrlService
  def self.execute(query)
    result = Giphy.search(query, limit: 1).first
    result.fixed_height_downsampled_image.url.to_s
  end
end
