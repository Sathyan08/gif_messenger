require './app/models/message_service'

class GifMessenger < Sinatra::Base
  get '/' do
    haml :form
  end

  post '/request' do
    MessageService.execute(query: params["search"], phone_number: params["phone_number"])
    redirect "/"
  end
end
