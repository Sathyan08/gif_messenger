require './app/models/gif_url_service'

class MessageService < Struct.new(:query, :phone_number)

  TWILIO_CLIENT = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  DEFAULT_BODY = "".freeze

  def self.deliver(query:, phone_number:)
    new(query, phone_number).deliver
  end

  def deliver
    twilio_client.messages.create(
                                  to: formatted_phone_number,
                                  from: ENV['TWILIO_FROM_NUMBER'],
                                  body: DEFAULT_BODY,
                                  media_url: GifUrlService.find_url(query)
                                  )
  end

  private

  def formatted_phone_number
    @formatted_phone_number ||= phone_number_prefix + standardized_phone_number
  end

  def standardized_phone_number
    phone_number.gsub(/\D/, '')
  end

  def phone_number_prefix
    case phone_number
    when phone_number.start_with?("+1")
      ""
    when phone_number.start_with?("1")
      "+"
    else
      "+1"
    end
  end

  def twilio_client
    TWILIO_CLIENT
  end
end
