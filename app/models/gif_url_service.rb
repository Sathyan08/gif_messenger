class GifUrlService
  GIPHY_CDN_ROOT_PATH = "http://i.giphy.com"
  SIZE_LIMIT = 500000

  def self.find_url(query)

    # TODO: Add the ability to go to the next page if none of the images are below the size limit
    result = Giphy.search(query, limit: 25).find { |gif| gif.original_image.size < SIZE_LIMIT }
    URI.join(GIPHY_CDN_ROOT_PATH, "#{result.id}.gif")
  end
end
