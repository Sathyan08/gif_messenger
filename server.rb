require './app/models/gif_url_service'

class GifMessenger < Sinatra::Base
  get '/' do
    binding.pry
    "Hello World"
  end
end
