require './app/models/message_service'

class GifMessenger < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  MESSAGE_SUCCESS_MESSAGE = "Message successfully sent".freeze

  get '/' do
    haml :form
  end

  post '/request' do
    result = MessageService.execute(query: params["search"], phone_number: params["phone_number"])

    result.error_message ? flash[:warning] = result.error_message : flash[:info] = MESSAGE_SUCCESS_MESSAGE
    redirect "/"
  end
end
