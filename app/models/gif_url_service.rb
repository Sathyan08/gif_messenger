class GifUrlService
  GIPHY_CDN_ROOT_PATH = "http://i.giphy.com"

  def self.find_url(query)
    result = Giphy.search(query, limit: 1).first
    URI.join(GIPHY_CDN_ROOT_PATH, "#{result.id}.gif")
  end
end
