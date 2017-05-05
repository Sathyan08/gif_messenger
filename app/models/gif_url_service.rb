class GifUrlService
  def self.execute(query)
    results = Giphy.search(query, limit: 1)
    results.first.url.to_s
  end
end
