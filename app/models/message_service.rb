require './app/models/gif_url_service'

class MessageService
  attr_reader :query, :phone_number

  TWILIO_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  DEFAULT_BODY = "Hello"

  def self.execute(query:, phone_number:)
    new(query: query, phone_number: phone_number).deliver
  end

  def deliver
    twilio_client.messages.create(
                                  to: formatted_phone_number,
                                  from: ENV['TWILIO_FROM_NUMBER'],
                                  body: DEFAULT_BODY,
                                  media_url: GifUrlService.execute(query)
                                  )
  end

  private

  def initialize(query:, phone_number:)
    @query = query
    @phone_number = phone_number
  end

  def formatted_phone_number
    @formatted_phone_number ||= begin
      case phone_number
      when phone_number.start_with?("+1")
        phone_number
      when phone_number.start_with?("1")
        "+" + phone_number
      else
        "+1" + phone_number
      end
    end
  end

  def twilio_client
    TWILIO_CLIENT
  end
end
