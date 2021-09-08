require 'line/bot'

class WebhookController < ApplicationController
  protect_from_forgery except: [:callback] # CSRF対策無効化

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head 470
    end

    events = client.parse_events_from(body)
    events.each { |event|
      case event
      when Line::Bot::Event::Follow
        line_user_id = event['source']['userId']
        if !Customer.exists?(line_user_id: line_user_id) && line_user_id.present?
          name = LineApi.get_profile(line_user_id)['displayName']
          customer = Customer.create!(name: name, line_user_id: line_user_id)

          # 登録完了後のチケットを送る
          item = Item.find_by(detail_use: "初回登録")
          tickets = GajoenApi.get_tickets(item.brand_id, item.item_id)
          message = "登録ありがとうございました！チケットはこちらになります\n" + tickets['url']
          LineApi.push_message(line_user_id, message)
          tickets['request_code']
          ticket = Ticket.create!(create_ticket_prams(tickets, customer.id))
        end
      end
    }
    head :ok
  end

  private

  def create_ticket_prams(params, id)
    {
      :ticket_code      =>  params['code'],
      :request_code     =>  params['request_code'],
      :url              =>  params['url'],
      :status           =>  "issued",

      :available_begin  =>  params['activatable_begin'],
      :available_end    =>  params['activatable_end'],
      :customer_id      =>  id,
    }
  end
end
