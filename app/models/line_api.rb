require 'line/bot'

class LineApi
  def self.get_profile(user_id)
    uri = URI.parse("https://api.line.me/v2/bot/profile/" + user_id)
    req = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    req['Authorization'] = "Bearer "+ ENV['LINE_CHANNEL_TOKEN']
    req['Content-Type'] = "application/json"

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = https.request(req)

    JSON.parse(res.body)
  end

  def self.push_message(user_id, message)
    client = self.create_client
    message_push = create_send_message(message)
    client.push_message(user_id, message_push)
  end

  def self.reply_message(reply_token, message)
    client = self.create_client
    message_push = create_send_message(message)
    client.reply_message(reply_token, message_push)
  end

  private

  def self.create_client
    Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
  end

  def self.create_send_message(message)
    {
      type: 'text',
      text: message
    }
  end
end
